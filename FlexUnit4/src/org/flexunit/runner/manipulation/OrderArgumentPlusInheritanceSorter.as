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
	import flash.utils.Dictionary;
	
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.manipulation.sortingInheritance.ISortingInheritanceCache;
	import org.flexunit.runners.model.TestClass;
	import org.flexunit.utils.DescriptionUtil;
	
	/**
	 * A <code>MetadataSorter</code> compares two values to determine which value is greater. This particular
	 * sorter also looks at class inheritance depth to group ordering by parent and subclass
	 * 
	 */
	public class OrderArgumentPlusInheritanceSorter implements ISorter, IFixtureSorter  {

		/**
		 * ORDER_ARG_INHERITANCE_SORTER is an <code>ISorter</code> and <code>IFixtureSorter</code> which can sort
		 * methods by their order and fixture elements by order and inheritance
		 */
		public static var DEFAULT_SORTER:ISorter = new OrderArgumentPlusInheritanceSorter( OrderArgumentSorter.ORDER_ARG_SORTER );

		/**
		 * @private 
		 */		
		private var existingSorter:ISorter; 
		

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
		 * Compares its two arguments for order. Returns a negative integer, zero, or a positive integer 
		 * as the first argument is less than, equal to, or greater than the second.
		 * 
		 * @param o1 <code>IDescription</code> the first object to be compared.
		 * @param o2 <code>IDescription</code> the second object to be compared.
		 * 
		 * @return a negative integer, zero, or a positive integer 
		 * as the first argument is less than, equal to, or greater than the second.
		 * */		
		public function compareFixtureElements(o1:IDescription, o2:IDescription, cache:ISortingInheritanceCache, superFirst:Boolean = true):int {
			var o1InheritedOrder:int = cache.getInheritedOrder( o1, superFirst );
			var o2InheritedOrder:int = cache.getInheritedOrder( o2, superFirst );
			
			//Determine the ordering of the two respected names
			if (o1InheritedOrder < o2InheritedOrder)
				return 1;
			if (o1InheritedOrder > o2InheritedOrder)
				return -1;

			return compare( o1, o2 );
		}	
		
		/**
		 * Compares its two arguments for order. Returns a negative integer, zero, or a positive integer 
		 * as the first argument is less than, equal to, or greater than the second. If the two objects are
		 * of equal order number, then we are simply going to return them in alphabetical order..
		 * 
		 * This method also takes into account the order of the found objects in terms of their super and sub classes
		 * 
		 * @param o1 <code>IDescription</code> the first object to be compared.
		 * @param o2 <code>IDescription</code> the second object to be compared.
		 * */
		public function compare( o1:IDescription, o2:IDescription ):int {
			//If they are equal inheritance, then check the order
			return existingSorter.compare( o1, o2 );
		}

		/**
		 * Constructor
		 *  
		 * @param existingSorter existing order sorting class
		 * @param testClass the test class
		 * @param superFirst a direction fla indicating the polarity of hierarchy
		 * 
		 */
		public function OrderArgumentPlusInheritanceSorter( existingSorter:ISorter ) {
			this.existingSorter = existingSorter;
		}
	}
}