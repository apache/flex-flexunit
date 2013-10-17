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
package org.flexunit.runner.manipulation {
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.constants.AnnotationArgumentConstants;
	import org.flexunit.runner.IDescription;
	
	/**
	 * A <code>MetadataSorter</code> compares two values to determine which value is greater.
	 * 
	 */
	public class OrderArgumentSorter implements ISorter  {
		/**
		 * NULL is a <code>Sorter</code> that leaves elements in an undefined order
		 */
		//public static var NULL:Sorter = new Sorter(none);
		
		/**
		 * ORDER_ARG_SORTER is an <code>ISorter</code> that sorts elements by their order argument
		 */
		public static var ORDER_ARG_SORTER:ISorter = new OrderArgumentSorter();
		
		/**
		 * Does not compare its two arguments for order. Returns a zero regardless of the arguments being passed.
		 * 
		 * @param o1 <code>IDescription</code> the first object to be compared.
		 * @param o2 <code>IDescription</code> the second object to be compared.
		 * */
/*		private static function none( o1:IDescription, o2:IDescription ):int {
			return 0;
		}
*/
		/**
		 * Sorts the test in <code>runner</code> using <code>compare function</code>.
		 * 
		 * @param object
		 */
		public function apply(object:Object):void {
			if (object is ISortable) {
				var sortable:ISortable = (object as ISortable);
				sortable.sort(this);
			}
		}
		
		/**
		 * Determines the value of the order for the argument if an order exists.
		 * 
		 * @param o1 <code>IDescription</code> the object to have its order checked.
		 * */
		protected function getOrderValueFrom( object:IDescription ):Number {
			var order:Number = 0;		
			
			var metadataArray:Array = object.getAllMetadata();
			var metaDataAnnotation:MetaDataAnnotation;
			
/*			if ( metadataArray.length == 0 ) {
				trace("Stop");				
			}*/
			
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
		 * Compares its two arguments for order. Returns a negative integer, zero, or a positive integer 
		 * as the first argument is less than, equal to, or greater than the second. If the two objects are
		 * of equal order number, then we are simply going to return them in alphabetical order..
		 * 
		 * @param o1 <code>IDescription</code> the first object to be compared.
		 * @param o2 <code>IDescription</code> the second object to be compared.
		 * */
		public function compare(o1:IDescription, o2:IDescription):int {
			var a:Number;
			var b:Number; 
			
			var o1Meta:Array = o1.getAllMetadata();
			var o2Meta:Array = o2.getAllMetadata();
			
			//Determine if the first object has an order
			if ( o1Meta ) { 
				a = getOrderValueFrom( o1 );
			} else {
				a = 0;
			}
			
			//Determine if the second object has an order
			if ( o2Meta ) {
				b = getOrderValueFrom( o2 );
			} else {
				b = 0;
			}
			
			//Determine the ordering of the two respected objects
			if (a < b)
				return -1;
			if (a > b)
				return 1;
			
			return 0;
		}	
	}
}