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
package org.flexunit.runner.notification
{
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	
	/**
	 * The <code>IRunListener</code> is an interface used be classes that want to act as a run listener,
	 * responding to events that occur during a test run.  If the <code>IRunListener</code> is registered
	 * to an <code>IRunNotifier</code> it will be notified of the following eventts:
	 * 
	 * <ul>
	 * <li>A test run has started</li>
	 * <li>A test run has finished</li>
	 * <li>A test has started</li>
	 * <li>A test has finished</li>
	 * <li>A test has failed</li>
	 * <li>A test has violated an assumption</li>
	 * <li>A test has been ignored</li>
	 * </ul>
	 * <br/>
	 * 
	 * While there is generally only one <code>IRunNotifier</code> present in the system at any given time, 
	 * there can be multiple <code>IRunListener</code>s.  <code>IRunListener</code>s listen to these 
	 * messages from the <code>IRunNotifier</code> and optionally perform some action.<br/> 
	 * 
	 * Examples of some <code>IRunNotifier</code>s built into FlexUnit4 include the 
	 * <code>TraceListener</code> and <code>TextListener</code>.
	 * 
	 * @see org.flexunit.internals.TraceListener
	 * @see org.flexunit.internals.TextListener
	 */
	public interface IRunListener
	{	
		/**
		 * Called before any tests have been run and the test run is starting.
		 * 
		 * @param description The <code>IDescription</code> of the top most 
		 * <code>IRunner</code>.
		 */
		function testRunStarted( description:IDescription ):void;
		
		/**
		 * Called when all tests have finished and the test run is done.
		 * 
		 * @param result The <code>Result</code> of the test run, including all the tests 
		 * that have failed.
		 */
		function testRunFinished( result:Result ):void;
		
		/**
		 * Called when an atomic test is about to be begin.
		 * 
		 * @param description The <code>IDescription</code> of the test that is about 
		 * to be run (generally a class and method name).
		 */
		function testStarted( description:IDescription ):void;
		
		/**
		 * Called when an atomic test has finished, whether the test succeeds or fails.
		 * 
		 * @param description The <code>IDescription</code> of the test that finished.
		 */
		function testFinished( description:IDescription ):void;
		
		/** 
		 * Called when an atomic test fails.
		 * 
		 * @param failure The <code>Failure</code> indicating why the test has failed.
		 */
		function testFailure( failure:Failure ):void;
		
		/**
		 * Called when an atomic test flags that it assumes a condition that is false.
		 * 
		 * @param failure The <code>Failure</code> indicating the 
		 * <code>AssumptionViolatedException</code> that was thrown.
		 */
		function testAssumptionFailure( failure:Failure ):void;
		
		/**
		 * Called when a test will not be run, generally because a test method is annotated 
		 * with the <code>Ignore</code> tag.
		 * 
		 * @param description The <code>IDescription</code> of the test that will be
		 * ignored.
		 */
		function testIgnored( description:IDescription ):void;
	}
}