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
	/**
	 * Interface for runners that allow sorting of tests. By sorting tests based on when they last failed, 
	 * most recently failed first, you can reduce the average time to the first test failing. Test sorting 
	 * should not be used to cope with order dependencies between tests. Tests that are isolated from each 
	 * other are less expensive to maintain and can be run individually. 
	 * */
	public interface ISortable
	{
		/**
		 * Sorts the tests using <code>sorter</code>.
		 * 
		 * @param sorter The <code>Sorter</code> to use for sorting the tests.
		 */
		function sort(sorter:ISorter):void;
	}
}