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
package org.flexunit.runner {
	import org.flexunit.runner.manipulation.ISort;
	
	/**
	 * An <code>IRequest</code> is an abstract description of tests to be run.  It represents an object that 
	 * wraps tests when they are presented to the <code>FlexUnitCore</code>.  <code>IRequest</code>s can be 
	 * filtered and sorted to control the subset and order of tests to be executed.<br/>
	 * 
	 * The key property of the <code>IRequest</code> that the <code>FlexUnitCore</code> needs is the 
	 * <code>IRunner</code>.  The <code>IRunner</code> is an interface implemented by any object 
	 * capable of executing a specific type of test.<br/>
	 * 
	 * @see org.flexunit.runner.IRunner
	 */
	public interface IRequest {
		/**
		 * Returns that <code>ISort</code> that is being used by this <code>IRequest</code>.
		 */
		function get sort():ISort;
		function set sort( value:ISort ):void;
		
		/**
		 * Returns an <code>IRunner</code> for this <code>IRequest</code>.
		 */
		function get iRunner():IRunner;
		
		/**
		 * Creates a request that is filtered based on the provided
		 * <code>filterOrDescription</code> which is either an <code>Filter</code>
		 * or an <code>IDescription</code>.
		 * 
		 * @param filterOrDescription The <code>Filter</code> or <code>Description</code> 
		 * to apply to this <code>Request</code>.
		 * 
		 * @return a <code>Request</code> that has been filtered.
		 */
		function filterWith( filterOrDescription:* ):Request;
	}
}