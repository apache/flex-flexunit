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
package org.flexunit.experimental.theories.internals
{
	import flex.lang.reflect.Field;
	
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.experimental.theories.IParameterSupplier;
	import org.flexunit.experimental.theories.ParameterSignature;
	import org.flexunit.experimental.theories.PotentialAssignment;
	import org.flexunit.runner.external.IExternalDependencyData;
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.runners.model.TestClass;
	
	/**
	 * The <code>AllMembersSupplier</code> determines what values can be applied to parameters in theories 
	 * in a specific theory test method.
	 */
	public class AllMembersSupplier implements IParameterSupplier {
		/**
		 * @private
		 */
		private var testClass:TestClass;
		
		/**
		 * Constructor.
		 * 
		 * @param testClass The Class that is being tested for theories.
		 */
		public function AllMembersSupplier( testClass:TestClass ) {
			this.testClass = testClass;
		}
		
		/**
		 * Generates an Array containing all possible values that a particular <code>ParameterSignature</code> could have.
		 * 
		 * @param sig The provided parameter signature.
		 * 
		 * @return an Array containing all possible values that a particular <code>ParameterSignature</code> could have.
		 */
		public function getValueSources( sig:ParameterSignature ):Array {
			var list:Array = new Array();

			addFields(sig, list);
			addSinglePointMethods(sig, list);
			addMultiPointMethods(sig, list);
	
			return list;
		}
		
		/**
		 * Adds potential parameter values that are contained in variables to the list of potential values.
		 * 
		 * @param sig The signature of the parameter that can accept values.
		 * @param list An Array that contains all possible values that can be provided to the current <code>ParameterSignature</code>.
		 */
		private function addFields( sig:ParameterSignature, list:Array ):void {
			var fields:Array = testClass.klassInfo.fields;
			var field:Field;

			for ( var i:int=0; i<fields.length; i++ ) {
				field = fields[ i ] as Field;
				
				//Determine if the field is a static variable
				if ( field.isStatic ) {
					//Determine if it is an individual variable or an array of variables and if they are datapoints, if they are
					//add them to the list of values the parameter can use
					if (sig.canAcceptArrayType(field)
							&& field.hasMetaData( AnnotationConstants.DATA_POINTS ) ) {
						addArrayValues(field.name, list, getStaticFieldValue(field));
					} else if (sig.canAcceptType(field.type) && field.hasMetaData( AnnotationConstants.DATA_POINT ) ) {
						list.push(PotentialAssignment
								.forValue(field.name, getStaticFieldValue(field)));
					} else if ( ( field.getObj() is IExternalDependencyData ) && 
						        ( field.hasMetaData( AnnotationConstants.DATA_POINTS ) ) ) {
						addArrayValues(field.name, list, getExternalFieldValue(field));
					}
				}
			}
		}
		
		/**
		 * Adds potential individual parameter value that is contained in a method to the list of potential values.
		 * 
		 * @param sig The signature of the parameter that can accept values.
		 * @param list An Array that contains all possible values that can be provided to the current <code>ParameterSignature</code>.
		 */
		private function addSinglePointMethods( sig:ParameterSignature, list:Array ):void {
			var dataPointMethod:FrameworkMethod;
			var methods:Array = testClass.getMetaDataMethods( AnnotationConstants.DATA_POINT );
			var type:Class;
			
			for ( var i:int=0; i<methods.length; i++ ) {
				dataPointMethod = methods[ i ] as FrameworkMethod;
				type = sig.type;
				
				if ( dataPointMethod.producesType( type ) ) {
					list.push( new MethodParameterValue( dataPointMethod ) );
				}
			}
		}
		
		/**
		 * Adds potential parameter values that are contained in a method to the list of potential values.
		 * 
		 * @param sig The signature of the parameter that can accept values.
		 * @param list An Array that contains all possible values that can be provided to the current <code>ParameterSignature</code>.
		 */
		private function addMultiPointMethods( sig:ParameterSignature, list:Array ):void {
			var dataPointsMethod:FrameworkMethod;
			var methods:Array = testClass.getMetaDataMethods( AnnotationConstants.DATA_POINTS );
			var type:Class;

			for ( var i:int=0; i<methods.length; i++ ) {
				dataPointsMethod = methods[ i ] as FrameworkMethod;

				try {
					if ( sig.canAcceptArrayTypeMethod(dataPointsMethod) ) {
						addArrayValues( dataPointsMethod.name, list, dataPointsMethod.invokeExplosively(null) );
					}
				} catch ( e:Error ) {
					// ignore and move on
				}
			}
		}
		
		/**
		 * Adds potential variables that the parameter can use to the list of available parameters.
		 * 
		 * @param name The name of the field variable.
		 * @param list An array contianing all possible values that could be assigned to a potential parameter.
		 * @param array An object that contains all possible values that are contained in the field.
		 */
		private function addArrayValues( name:String, list:Array, array:Object ):void {
			for (var i:int=0; i < (array as Array).length; i++) {
				list.push( PotentialAssignment.forValue( name + "[" + i + "]", array[i] ) );
			} 
		}
		
		/**
		 * Returns the static field value associated with the field.
		 * 
		 * @param field The field that contains the object.
		 * 
		 * @return The static object that was in the field.
		 * 
		 * @throws Error unexpected: field from getClass doesn't exist on object
		 */
		private function getStaticFieldValue( field:Field ):Object {
			try {
				return field.getObj(null);
			} catch ( e:TypeError ) {
				throw new Error(
						"unexpected: field from getClass doesn't exist on object");
			}
			return null; 
		}

		private function getExternalFieldValue( field:Field ):Object {
			try {
				var loader:IExternalDependencyData = field.getObj(null) as IExternalDependencyData; 
				return loader.data;
			} catch ( e:TypeError ) {
				throw new Error(
					"Unable to retrieve data from IExternalDependencyData source");
			}
			return null; 
		}
		
	}
}

import org.flexunit.experimental.theories.internals.error.CouldNotGenerateValueException;
import org.flexunit.experimental.theories.IPotentialAssignment;
import org.flexunit.runners.model.FrameworkMethod;

class MethodParameterValue implements IPotentialAssignment {
	private var method:FrameworkMethod

	public function MethodParameterValue( dataPointMethod:FrameworkMethod ) {
		method = dataPointMethod;
	}

	public function getValue():Object {
		try {
			return method.invokeExplosively( null );
		} catch ( e:TypeError ) {
			throw new Error(
					"unexpected: argument length is checked");
		} catch (e:Error) {
			throw new CouldNotGenerateValueException();
			// do nothing, just look for more values
		}
		
		return null;
	}

	public function getDescription():String  {
		return method.name;
	}
	
	public function toString():String {
		return method.method.name;
	}
}
