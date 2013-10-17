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

//This class is highly duplicated from OrderArgumentSorter and we should abstract common functionality
package org.flexunit.runner.manipulation.fields {
	import flex.lang.reflect.Field;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.metadata.MetaDataArgument;

	import org.flexunit.constants.AnnotationArgumentConstants;

	/**
	 * A field sorter capable of sorting fields based on the order argument 
	 * @author mlabriola
	 * 
	 */
	public class FieldMetaDataSorter implements IFieldSorter {
		
		/**Controls a A to Z verssus Z to A sort **/
		private var invert:Boolean = false;
		
		/**
		 * Determines the value of the order for the argument if an order exists.
		 * 
		 * @param field <code>Field</code> the object to have its order checked.
		 * */
		protected function getOrderValueFrom( field:Field ):Number {
			var order:Number = 0;		
			
			var metadataArray:Array = field.metadata;
			var metaDataAnnotation:MetaDataAnnotation;
			
			for ( var i:int=0; i<metadataArray.length; i++ ) {
				metaDataAnnotation = metadataArray[ i ] as MetaDataAnnotation;
				
				//Determine if the node contains an 'order' key, if it does, get the order number
				var metaArg:MetaDataArgument = metaDataAnnotation.getArgument( AnnotationArgumentConstants.ORDER, true );
				if ( metaArg ) {
					order = Number( metaArg.value );
					break;
				}
			} 
			
			return order;
		}

		/**
		 * Compares field1 and field2 indicating which is first or second in order 
		 * @param field1
		 * @param field2
		 * @return 
		 * 
		 */
		public function compare( field1:Field, field2:Field ):int {
			var a:Number;
			var b:Number; 
			
			//Determine if the first object has an order
			if ( field1 ) { 
				a = getOrderValueFrom( field1 );
			} else {
				a = 0;
			}
			
			//Determine if the second object has an order
			if ( field2 ) {
				b = getOrderValueFrom( field2 );
			} else {
				b = 0;
			}
			
			//Determine the ordering of the two respected objects
			if (a < b)
				return invert?1:-1;
			if (a > b)
				return invert?-1:1;
			
			return 0;
		}
		
		/**
		 * Constructor 
		 * @param invert indicates a top down or bottom up sort
		 * 
		 */
		public function FieldMetaDataSorter( invert:Boolean = false ) {
			this.invert = invert;
		}
	}
}