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
package org.flexunit.internals.builders {
	import org.flexunit.runner.Description;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.notification.IRunNotifier;
	import org.flexunit.runner.notification.StoppedByUserException;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.IAsyncTestToken;
	
	/**
	 * The <code>IgnoredClassRunner</code> is an <code>IRunner</code> for test classes that are 
	 * to be ignored.  The runner will not run any tests in the provided test class.  Instead,
	 * it will report that the class has been ignored, providing information about that tests that
	 * are present in the ignored testClass.
	 */
	public class IgnoredClassRunner implements IRunner {
		/**
		 * @private
		 */
		private var testClass:Class;

		/**
		 * @private
		 */
		protected var stopRequested:Boolean = false;

		/** 
		 * Constructor. 
		 * 
		 * param testClass The class that is to be ignored.
		 */ 
		public function IgnoredClassRunner( testClass:Class ) {
			this.testClass = testClass;
		}
		
		/**
		 * Instructs the <code>notifier</code> that a class has been ignored, indiciating how many
		 * tests have been ignored in the process.  The provided <code>token</code> is then notified
		 * that the <code>IgnoredClassRunner</code> has finished.
		 * 
		 * @param notifier The <code>IRunNotifier</code> to notify that the class has been ignored.
		 * @param token The <code>AsyncTestToken</code> to notify that the test class has been ignored.
		 */ 
		public function run( notifier:IRunNotifier, previousToken:IAsyncTestToken ):void {
			if ( stopRequested ) {
				previousToken.sendResult( new StoppedByUserException() );
				return;
			}

			notifier.fireTestIgnored( description );
			previousToken.sendResult();
		}
		
		/**
		 * Ask that the tests run stop before starting the next test. Phrased politely because
		 * the test currently running will not be interrupted. 
		 */
		public function pleaseStop():void {
			stopRequested = true;
		}		

		/**
		 * Returns an <code>IDescription</code> of the testClass.  This <code>IDescription</code>
		 * is used to provide information about this testClass that can be used in order to determine
		 * how many tests have been ignored.
		 */ 
		public function get description():IDescription {
			return Description.createSuiteDescription( testClass );
		}
	}
}