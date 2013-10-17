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
package org.flexunit.runners.model {
	import flex.lang.reflect.Method;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.constants.AnnotationArgumentConstants;
	import org.flexunit.token.AsyncTestToken;
	
	/**
	 * Represents a method on a test class to be invoked at the appropriate point in
	 * test execution. These methods are usually marked with an annotation (such as
	 * <code>Test</code>, <code>Before</code>, <code>After</code>, <code>BeforeClass</code>, 
	 * <code>AfterClass</code>, etc.).
	 */
	public class FrameworkMethod {
		/**
		 * @private
		 */
		private var _method:Method;

		private var asyncFound:Boolean = false;
		private var _async:Boolean = false;

		/**
		 * Construcotr.
		 * 
		 * Returns a new <code>FrameworkMethod</code> for a provided<code>method</code>.
		 * 
		 * @param method The metadata for a particular test method.
		 */
		//We don't really have a method class, but we do have a chunk of XML that can describe our 
		//method, so we will preserve it that way I also suspect we are going to need a class reference 
		//to do all of the elegant things the Java implementation can do
		public function FrameworkMethod( method:Method ) {
			_method = method;
		}
		/**
		 * Returns the underlying method.
		 */
		public function get method():Method {
			return _method;
		}

		/**
		 * Returns the method's name.
		 */
		public function get name():String {
			return method.name;
		}
		
		/**
		 * Returns the method's metadata.
		 */
		public function get metadata():Array {
			return method.metadata;
		}

		//Consider upper/lower case issues
		/**
		 * Returns a metadata argument string based on whether the method's metadata has a matching <code>metaDataTag</code>
		 * and <code>key</code>.
		 * 
		 * @param metaDataTag The metadata tag to search for in the method's metadata.
		 * @param key The key to find a specific atrribute argument in the <code>metaDataTag</code>.
		 * 
		 * @return the specific String if the <code>metaDataTag</code> and <code>key</code> exist, a value of 'true' if there 
		 * is an argument that has a value that matches the <code>key</code>, or an empty or null String if the key is not 
		 * found for the given <code>metaDataTag</code>.
		 */
		public function getSpecificMetaDataArgValue( metaDataTag:String, key:String ):String {
			var metaDataAnnotation:MetaDataAnnotation = method.getMetaData( metaDataTag );
			var metaDataArgument:MetaDataArgument;
			var returnValue:String;
			
			if ( metaDataAnnotation ) {
				metaDataArgument = metaDataAnnotation.getArgument( key, true );
			}
			
			if ( metaDataArgument ) {			
				returnValue = metaDataArgument.value;
			}
			
			return returnValue;
		}

		//Store me so I only do this once
		public function get isAsync():Boolean {
			if (!asyncFound) {
				asyncFound = true;
				_async = determineAsync();
			}
			
			return _async;
		}
		
		private function determineAsync():Boolean {
			var async:Boolean = false;
			var annotations:Array = method.metadata;
			var annotation:MetaDataAnnotation;
			
			if ( annotations ) {
				for ( var i:int=0; i<annotations.length; i++ ) {
					annotation = annotations[ i ] as MetaDataAnnotation;
					if ( annotation.hasArgument( AnnotationArgumentConstants.ASYNC ) ) {
						async = true;
						break;
					}
				}
			}
			
			return async;
		}

		/**
		 * Determine if the method has metadata for a specific <code>metaDataTag</code>.
		 * 
		 * @param metaDataTag The metadata tag to search for in the method's metadata.
		 * 
		 * @return a Boolean value indicating if the method has specific metadata that matches the <code>metaDataTag</code>.
		 */
		public function hasMetaData( metaDataTag:String ):Boolean {
			return method.hasMetaData( metaDataTag );
		}
		
		/**
		 * Returns a Boolean value indicating whether the method has no parameters and 
		 * whether the method has a return type that matches the provided <code>type</code>.
		 * 
		 * @param type The return type to check for in the method.
		 * 
		 * @reutrn a Boolean value indicating whether the method has no parameters and 
		 * whether the method has a return type that matches the provided <code>type</code>.
		 */
		public function producesType( type:Class ):Boolean {
			return ( ( method.parameterTypes.length == 0 ) &&
					( type == method.returnType ) );
		}
			
		/**
		 * Calls the method with the provided set of <code>params</code> for the <code>target</code> class.
		 * 
		 * @param target The class that contains the method.
		 * @param params The parameters to be supplied to the method.
		 */
		public function applyExplosively( target:Object, params:Array ):void {
			//var method:Function = getMethodFromTarget( target );
			
			var result:Object = method.apply( target, params );
		}
		
		/**
		 * Returns the result of invoking this method on <code>target</code> with
		 * parameters <code>params</code>. <code>InvocationTargetException</code>s thrown are
		 * unwrapped, and their causes rethrown.
		 * 
		 * @param parentToken The <code>AsyncTestToken</code> to be notified when the method has been run.
		 * @param target The class that contains the method.
		 * @param params The parameters to be supplied to the method.
		 */
		public function invokeExplosivelyAsync1( parentToken:AsyncTestToken, target:Object, ...params ):void {
			applyExplosively( target, params );
			parentToken.sendResult();
		}
		
		/**
		 * Calls the method with the provided set of <code>params</code> for the <code>target</code> class.
		 * 
		 * 
		 * @param parentToken The <code>AsyncTestToken</code> to be notified when the method has been run.
		 * @param target The class that contains the method.
		 * @param params The parameters to be supplied to the method.
		 */
		public function invokeExplosively( target:Object, ...params ):Object {
			var result:Object = method.apply( target, params );
			
			return result;
		}

		/**
		 * Adds to <code>errors</code> if this method:
		 * <ul>
		 * <li>is not public, or</li>
		 * <li>takes parameters, or</li>
		 * <li>returns something other than void, or</li>
		 * <li>is static (given <code>isStatic</code> is <code>false</code>), or</li>
		 * <li>is not static (given <code>isStatic</code> is <code>true</code>).</li>
		 * </ul>
		 * 
		 * @param isStatic A Boolean value indicating whether it is acceptable that the method
		 * is a static method.
		 * @param errors An array of errors that will potential have the current method added if
		 * the method does not fufill the proper criteria.
		 */
		public function validatePublicVoidNoArg( isStatic:Boolean, errors:Array ):void {
			validatePublicVoid(isStatic, errors);

			var needsParams:Boolean = method.parameterTypes.length > 0;

			if ( needsParams )
				errors.push(new Error("Method " + name + " should have no parameters"));
		}

		/**
		 * Adds to <code>errors</code> if this method:
		 * <ul>
		 * <li>is not public, or</li>
		 * <li>returns something other than void, or</li>
		 * <li>is static (given <code>isStatic</code> is <code>false</code>), or</li>
		 * <li>is not static (given <code>isStatic</code> is <code>true</code>).</li>
		 * </ul>
		 * 
		 * @param isStatic A Boolean value indicating whether it is acceptable that the method
		 * is a static method.
		 * @param errors An array of errors that will potential have the current method added if
		 * the method does not fufill the proper criteria.
		 */
		public function validatePublicVoid( isStatic:Boolean, errors:Array ):void {

			if ( method.isStatic != isStatic) {
				var state:String = isStatic ? "should" : "should not";
				errors.push( new Error("Method " + name + "() " + state + " be static"));
			}

//			if (!Modifier.isPublic(fMethod.getDeclaringClass().getModifiers()))
//				errors.push(new Exception("Class " + fMethod.getDeclaringClass().getName() + " should be public"));
//			if (!Modifier.isPublic(fMethod.getModifiers()))
//				errors.push(new Exception("Method " + fMethod.getName() + "() should be public"));

			var isVoid:Boolean = !method.returnType;

			if ( !isVoid )
				errors.push(new Error("Method " + name + "() should be void"));
		}
		
		/**
		 * @private
		 * @return
		 */
		public function toString():String {
			return "FrameworkMethod " + this.name;
		}
	}
}
