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
package org.flexunit.runners.model {
	import org.flexunit.runner.IRunner;
	
	/**
	 * An <code>IRunnerBuilder</code> is a strategy for constructing <code>IRunner</code>s for classes.<br/>
	 * 
	 * Only writers of custom runners should use <code>IRunnerBuilder</code>s.  A custom runner class with a constructor 
	 * taking an <code>IRunnerBuilder</code> parameter will be passed the instance of <code>IRunnerBuilder</code> used 
	 * to build that runner itself.<br/>
	 *  
	 * For example, imagine a custom <code>IRunner</code> that builds suites based on a list of classes in a text file:
	 * 
	 * <pre>
	 * RunWith(TextFileSuite.as)
	 * SuiteSpecFile("mysuite.txt")
	 * class MySuite {}
	 * </pre>
	 * 
	 * The implementation of TextFileSuite might include:
	 * 
	 * <pre>
	 * public function TextFileSuite(testClass:Class, builder:IRunnerBuilder) {
	 *   // ...
	 *     var runner:IRunner = builder.runnerForClass( testClass );
	 *   // ...
	 * }
	 * </pre>
	 * 
	 * @see org.flexunit.runners.Suite
	 */
	public interface IRunnerBuilder {
		
		/**
		 * Returns a boolean value indicating if this builder will be able to handle the testClass or not
		 * 
		 * @param testClass The class to test to determine an <code>IRunner</code>.
		*/
		function canHandleClass( testClass:Class):Boolean;
		
		/**
		 * Returns an <code>IRunner</code> that can safely run the provided <code>testClass</code>.
		 * 
		 * @param testClass The class to for which to determine an <code>IRunner</code>.
		 * 
		 * @return an <code>IRunner</code> that can run the <code>testClass</code>.
		 */
		function safeRunnerForClass( testClass:Class ):IRunner;
		/**
		 * Constructs and returns a list of <code>IRunner</code>s, one for each child class in
		 * <code>children</code>.  Care is taken to avoid infinite recursion:
		 * this builder will throw an exception if it is requested for another
		 * runner for <code>parent</code> before this call completes.
		 * 
		 * @param parent The parent class that contains the <code>children</code>.
		 * @param children The child classes for which to find <code>IRunner</code>.
		 * 
		 * @return a list of <code>IRunner</code>s, one for each child class.
		 */
		function runners( parent:Class, children:Array ):Array;
		/**
		 * Returns an <code>IRunner</code> for a specific <code>testClass</code>.
		 * 
		 * @param testClass The test class for which to determine an <code>IRunner</code>.
		 * 
		 * @return an <code>IRunner</code> that will run the <code>testClass</code>.
		 */
		function runnerForClass( testClass:Class ):IRunner;
	}
}