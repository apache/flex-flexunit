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
package org.flexunit.runner.notification {
	import org.flexunit.runner.Description;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	
	/**
	 * If you need to respond to the events during a test run, extend <code>RunListener</code>
	 * and override the appropriate methods. If a listener throws an exception while processing a 
	 * test event, it will be removed for the remainder of the test run.
	 * 
	 * <p>
	 * For example, suppose you have a <code>Cowbell</code>
	 * class that you want to make a noise whenever a test fails. You could write:
	 * <pre>
	 * public class RingingListener extends RunListener {
	 * 	public function testFailure(failure:Failure):void {
	 * 		Cowbell.ring();
	 * 	}
	 * }
	 * </pre>
	 * </p>
	 * 
	 * <p>To invoke your listener, you need to run your tests through <code>FlexUnitCore</code>.
	 * <pre>
	 * core:FlexUnitCore = new FlexUnitCore();
	 * core.addListener(new RingingListener());
	 * core.run(MyTestClass);
	 * </pre></p>
	 * 
	 * @see org.flexunit.runner.FlexUnitCore
	 */
	public class RunListener implements IRunListener {
		/**
		 * The <code>Result</code> recieved for a finished test run.
		 */
		public var result:Result;

		/**
		 * Called before any tests have been run.
		 * @param description describes the tests to be run
		 */
		public function testRunStarted( description:IDescription ):void {
		}
		
		/**
		 * Called when all tests have finished
		 * @param result the summary of the test run, including all the tests that failed
		 */
		public function testRunFinished( result:Result ):void {
			this.result = result;
		}
		
		/**
		 * Called when an atomic test is about to be started.
		 * @param description the description of the test that is about to be run 
		 * (generally a class and method name)
		 */
		public function testStarted( description:IDescription ):void {
		}
	
		/**
		 * Called when an atomic test has finished, whether the test succeeds or fails.
		 * @param description the description of the test that just ran
		 */
		public function testFinished( description:IDescription ):void {
		}
	
		/** 
		 * Called when an atomic test fails.
		 * @param failure describes the test that failed and the exception that was thrown
		 */
		public function testFailure( failure:Failure ):void {
		}
	
		/**
		 * Called when an atomic test flags that it assumes a condition that is
		 * false
		 * 
		 * @param failure
		 *            describes the test that failed and the
		 *            <code> AssumptionViolatedException</code> that was thrown
		 */
		public function testAssumptionFailure( failure:Failure ):void {
		}
	
		/**
		 * Called when a test will not be run, generally because a test method is annotated 
		 * with <code> org.junit.Ignore</code>.
		 * 
		 * @param description describes the test that will not be run
		 */
		public function testIgnored( description:IDescription ):void {
		}
	}
}