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
package org.flexunit.runner.manipulation
{
	import org.flexunit.runner.Description;
	import org.flexunit.runner.IDescription;
	
	/**
	 * A <code>Sorter</code> orders tests. In general you will not need
	 * to use a <code>Sorter</code> directly. Instead, use <code>org.flexunit.runner.Request#sortWith(Function)</code>.
	 * 
	 * @see org.flexunit.runner.Request#sortWith()
	 */
	public class Sorter implements ISorter
	{	
		/**
		 * @private
		 */
		private var comparator:Function;
		
		/**
		 * Constructor.
		 * 
		 * Creates a <code>Sorter</code> that uses the <code>comparator</code>
		 * to sort tests.
		 * 
		 * @param comparator the <code>Function</code> to use when sorting tests.
		 */
		public function Sorter(comparator:Function) {
			this.comparator = comparator;
		}
		
		/**
		 * Sorts the test in <code>runner</code> using <code>comparator</code>/
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
		 * */
		public function compare(o1:IDescription, o2:IDescription):int {
			return comparator(o1, o2);
		}
	}
}