/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.flexunit.internals.dependency {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import flex.lang.reflect.Field;
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.constants.AnnotationArgumentConstants;
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.internals.builders.MetaDataBuilder;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runner.external.IExternalDependencyData;
	import org.flexunit.runner.external.IExternalDependencyLoader;
	import org.flexunit.runner.external.IExternalDependencyRunner;

	public class ExternalDependencyResolver extends EventDispatcher implements IExternalDependencyResolver {
		/**
		 * Event constant indicating that all outstanding dependencies are now resolved 
		 */
		public static const ALL_DEPENDENCIES_FOR_RUNNER_RESOLVED:String = "runnerDependenciesResolved";
		
		/**
		 * Event constant indicating that a given dependency failed to resolve itself 
		 */		
		public static const DEPENDENCY_FOR_RUNNER_FAILED:String = "runnerDependencyFailed";

		/**
		 * @private
		 * just used to check if they are a RunWith class
		 */
		private static var metaDataBuilder:MetaDataBuilder;
		/**
		 * @private
		 */
		private var clazz:Class;
		/**
		 * @private
		 */
		private var dependencyMap:Dictionary;
		/**
		 * @private
		 */
		private var runner:IExternalDependencyRunner;
		
		/**
		 * Indicates if the ExternalDependencies managed by this Resolver are
		 * all resolved.
		 *  
		 * @return true if the runner can now begin execution 
		 * 
		 */		
		public function get ready():Boolean {
			return ( keyCount == 0 );
		}

		/**
		 *
		 * Begins the execution of any external dependency loaders
		 *  
		 * @param loaderField
		 * @param targetField
		 * 
		 */		
		private function executeDependencyLoader( loaderField:Field, targetField:Field ):void {
			if ( loaderField && loaderField.isStatic ) {
				var loaderObj:Object = loaderField.getObj( null );

				if ( loaderObj is IExternalDependencyLoader ) {
					var token:ExternalDependencyToken = ( loaderObj as IExternalDependencyLoader ).retrieveDependency( clazz );
					token.targetField = targetField;
					token.addResolver( this );
					
					dependencyMap[ token ] = targetField;
				}
			}
		}
		
		/**
		 * Determines if the targetField is a IExternalDependencyValue
		 *  
		 * @param targetField
		 * @return 
		 * 
		 */
		private function isDependencyValue( targetField:Field ):Boolean {
			var field:* = targetField.getObj( null );
			
			return ( field is IExternalDependencyData );
		}

		/**
		 * Looks for a loaderField specified within the metaDataAnnotation
		 * 
		 * @param klassInfo
		 * @param metaDataAnnotation
		 * @return 
		 * 
		 */		
		private function getLoaderField( klassInfo:Klass, metaDataAnnotation:MetaDataAnnotation ):Field {
			var arguments:Array;
			var argument:MetaDataArgument;
			var loaderField:Field;
			var loaderFieldName:String;

			arguments = metaDataAnnotation.arguments;
			
			for ( var j:int=0 ; j<arguments.length; j++ ) {
				argument = arguments[ j ] as MetaDataArgument;
				
				if ( argument.key == AnnotationArgumentConstants.LOADER ) {
					loaderFieldName = argument.value;
					
					loaderField = klassInfo.getField( loaderFieldName );
					break;
				}
			}

			return loaderField;
		}

		/**
		 *
		 * Looks for external dependencies in the test class and begins the process of resolving them
		 *  
		 * @return true if there are external dependencies 
		 * 
		 */		
		public function resolveDependencies():Boolean {
			var klassInfo:Klass = new Klass( clazz );
			var targetFields:Array = klassInfo.fields;
			var targetField:Field;
			var metaDataAnnotation:MetaDataAnnotation;
			var loaderField:Field;
			var counter:uint = 0;
			
			//perhaps mark the class?
			for ( var i:int=0; i<targetFields.length; i++ ) {
				targetField = targetFields[ i ] as Field;
				
				if ( targetField.isStatic ) {
					/**
					 * Bug context:
					 * 
					 * This bug occurs because the loader is an IExternalDependencyData.
					 * This means it gets loaded independently by the first if statement
					 * and then again in the final one where it is referenced as a loader
					 * 
					 * Things is, when it loads, it needs to know the value it is populating
					 * Therefore, we need to execute the first one only when it is an
					 * IExternalDependencyData AND there happens to be metadata indicating
					 * it is either a DataPoint or a Parameter... it is not enough to know
					 * it implements the interface
					 * */
					//first check for parameters
					metaDataAnnotation = targetField.getMetaData( AnnotationConstants.PARAMETERS );
					
					if ( !metaDataAnnotation ) {
						//then check for datapoints
						metaDataAnnotation = targetField.getMetaData( AnnotationConstants.DATA_POINTS );
					}
					
					if ( ( metaDataAnnotation != null ) && isDependencyValue( targetField ) ) {
						//this field is an IExternalDependencyData and has a relevant piece of metadata
						executeDependencyLoader( targetField, targetField );
						counter++;
					} else if ( metaDataAnnotation ) {
						//It may be a loader scenario
						loaderField = getLoaderField( klassInfo, metaDataAnnotation );
						if ( loaderField && targetField ) {
							executeDependencyLoader( loaderField, targetField );
							counter++;
						}
					}
				}
			}
			
			return ( counter > 0 );
		}

		/**
		 * @private
		 */
		private function get keyCount():int {
			var counter:int = 0;

			for ( var key:* in dependencyMap ) {
				counter++;
			} 
			
			return counter;
		}

		/**
		 * Called by an ExternalDependencyToken when an IExternalDependencyLoader has completed resolving the dependency 
		 * and is ready  with data 
		 *  
		 * @param token the token keeping track of this dependency load
		 * @param data the returned data
		 * 
		 */
		public function dependencyResolved( token:ExternalDependencyToken, data:Object ):void {			
			var targetField:Field = token.targetField;
			var property:* = targetField.getObj( null ); 
			var clazz:Class = targetField.definedBy;

			if ( !( property is IExternalDependencyData ) ) {
				//If it is an IExternalDependencyValue then we have nothing to do
				if ( data is targetField.type ) {
					clazz[ targetField.name ] = data;	
				} else {
					throw new Error("Data Type mistmatch between returned data and field" );
				}
			}
			
			manageResponseCleanup( token );

			if ( keyCount == 0 ) {
				//all done
				dispatchEvent( new Event( ALL_DEPENDENCIES_FOR_RUNNER_RESOLVED ) );
			}
		} 
		/**
		 * Called by an ExternalDependencyToken when an IExternalDependencyLoader has failed to 
		 * resolve a dependency 
		 *  
		 * @param token the token keeping track of this dependency load
		 * @param data the returned data
		 * 
		 */
		public function dependencyFailed( token:ExternalDependencyToken, errorMessage:String ):void {
			
			//Okay, badness.. stop listening to all outstanding requests
			for ( var key:* in dependencyMap ) {
				var foundToken:ExternalDependencyToken = key as ExternalDependencyToken;
				manageResponseCleanup( foundToken );
			} 
			
			runner.externalDependencyError = errorMessage;

			dispatchEvent( new Event( DEPENDENCY_FOR_RUNNER_FAILED ) );
		}

		/**
		 * @private
		 */
		private function manageResponseCleanup( token:ExternalDependencyToken ):void {
			token.removeResolver( this );
			
			delete dependencyMap[ token ];
		}

		/**
		 * @private
		 */
		private function shouldResolveClass():Boolean {
			 return metaDataBuilder.canHandleClass( clazz );
		}
		
		/**
		 * Constructor 
		 * @param clazz with possible dependencies
		 * @param runner the runner pending until all dependencies are resolved
		 * 
		 */		
		public function ExternalDependencyResolver( clazz:Class, runner:IExternalDependencyRunner ) {
			this.clazz = clazz;
			this.dependencyMap = new Dictionary();
			this.runner = runner;

			if ( !metaDataBuilder ) {
				metaDataBuilder = new MetaDataBuilder(null);
			}
		}
	}
}
