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
package org.flexunit.runner
{
	import org.flexunit.runner.notification.IRunNotifier;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.IAsyncTestToken;
	
	/**
	 * An <code>IRunner</code> runs tests and notifies a <code> org.flexunit.runner.notification.RunNotifier</code>
	 * of significant events as it does so. You will need to subclass <code>Runner</code>
	 * to invoke a custom runner. When creating a custom runner, 
	 * in addition to implementing the abstract methods here you must
	 * also provide a constructor that takes as an argument the <code> Class</code> containing
	 * the tests.
	 * <br/>
	 * The default runner implementation guarantees that the instances of the test case
	 * class will be constructed immediately before running the test and that the runner
	 * will retain no reference to the test case instances, generally making them 
	 * available for garbage collection.
	 * 
	 * @see org.flexunit.runner.Description
	 */
	public interface IRunner
	{
		
		/**
		 * Run the tests for this runner.
		 * 
		 * @param notifier will be notified of events while tests are being run--tests being 
		 * started, finishing, and failing
		 */
		function run( notifier:IRunNotifier, previousToken:IAsyncTestToken ):void;
		function get description():IDescription;

		/**
		 * Ask that the tests run stop before starting the next test. Phrased politely because
		 * the test currently running will not be interrupted. 
		 */
		function pleaseStop():void;
	}
}