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
	
	import org.flexunit.runner.IDescription;
	
	/**
	 * A <code>MetadataSorter</code> compares two values to determine which value is greater.
	 * 
	 */
	public class OrderArgumentPlusAlphaSorter implements ISorter  {

		/**
		 * An instance of a sorter which does sorting on the order argument 
		 */
		protected var orderArgumentSorter:ISorter; 

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
		
		private static function getClassName( description:IDescription ):String {
			var methodName:String;
			
			if ( description && description.displayName ) {
				var namePieces:Array = description.displayName.split( '.' );
				if ( namePieces && namePieces.length > 0 ) {
					methodName = namePieces[namePieces.length-1];
				}
			}
			
			return methodName;
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
			var orderSortDecision:int = orderArgumentSorter.compare( o1, o2 );

			if ( orderSortDecision != 0 ) {
				return orderSortDecision;
			}

			var o1Name:String = getClassName( o1 );
			var o2Name:String = getClassName( o2 );
			
			//Determine the ordering of the two respected names
			if (o1Name < o2Name)
				return -1;
			if (o1Name > o2Name)
				return 1;
			
			return 0;
		}
		
		/**
		 * 
		 * Constructor 
		 */		
		public function OrderArgumentPlusAlphaSorter() {
			orderArgumentSorter = new OrderArgumentSorter();
		}
	}
}