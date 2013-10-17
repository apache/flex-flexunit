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
	import org.flexunit.runner.IDescription;

	/**
	 * Interface describing an IFilter which can be applied to a Request to filter
	 * the executed tests
	 *  
	 * @author mlabriola
	 * 
	 */
	public interface IFilter {
		/**
		 * @param description the description of the test to be run
		 * @return <code>true</code> if the test should be run
		 */
		function shouldRun( description:IDescription ):Boolean;
		
		/**
		 * Returns a textual description of this Filter
		 * @return a textual description of this Filter
		 */
		function describe( description:IDescription ):String;

		/**
		 * Invoke with a <code> org.flexunit.runner.IRunner</code> to cause all tests it intends to run
		 * to first be checked with the filter. Only those that pass the filter will be run.
		 * @param child the runner to be filtered by the receiver
		 * @throws NoTestsRemainException if the receiver removes all tests
		 */
		function apply( child:Object ):void;		
	}
}