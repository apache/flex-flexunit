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
package flex.lang.reflect.builders {
	import flex.lang.reflect.Field;

	public class FieldBuilder {
		/**
		 * @private
		 */
		private var classXML:XML;
		/**
		 * @private
		 */
		private var clazz:Class;

		/**
		 * Builds all field objects from the provided XML 
		 * @return an Array of fields
		 * 
		 */		
		public function buildAllFields():Array {
			var fields:Array = new Array();
			var variableList:XMLList = classXML.factory.variable;			
			
			for ( var i:int=0; i<variableList.length(); i++ ) {
				fields.push( new Field( variableList[ i ], false, clazz, false ) );
			}
			
			var staticVariableList:XMLList = classXML.variable;			
			
			for ( var j:int=0; j<staticVariableList.length(); j++ ) {
				fields.push( new Field( staticVariableList[ j ], true, clazz, false ) );
			}
			
			var propertyList:XMLList = classXML.factory.accessor;			
			
			for ( var k:int=0; k<propertyList.length(); k++ ) {
				fields.push( new Field( propertyList[ k ], true, clazz, true ) );
			}
			
			var staticPropertyList:XMLList = classXML.accessor;			
			
			for ( var l:int=0; l<staticPropertyList.length(); l++ ) {
				//we need to exclude the prototype accessor
				if ( staticPropertyList[ l ].@name != 'prototype' ) {
					fields.push( new Field( staticPropertyList[ l ], true, clazz, true ) );
				}
			}
			
			return fields;
		}

		/**
		 * 
		 * @param classXML
		 * @param clazz
		 * 
		 */		
		public function FieldBuilder( classXML:XML, clazz:Class ) {
			this.classXML = classXML;
			this.clazz = clazz; 			
		}
	}
}