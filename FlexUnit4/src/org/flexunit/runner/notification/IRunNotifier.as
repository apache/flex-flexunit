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
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	
	/**
	 * <code>IRunNotifier</code>s are a type of class that FlexUnit4 uses to notify others of an 
	 * event that occurred during testing.  There is generally only one <code>IRunNotifier</code>
	 * used in a test run at a time.  <code>IRunNotifier</code>s are used by the <code>IRunner</code> 
	 * classes to notify others of the following conditions:
	 * 
	 * <ul>
	 * <li>For the Test Run: Started/Finished</li>
	 * <li>For an Individual Test: Started/Failed/Ignored/Finished/AssumptionFailures</li>
	 * </ul><br/>
	 * 
	 * A parallel can be drawn with <code>IEventDispatcher</code>; however, unlike an event dispatcher, 
	 * <code>IRunNotifier</code>s have limitations on what types of objects can listen to their events.
	 * An <code>IRunListeners</code>s are used to listen to events that are broadcast by 
	 * <code>IRunNotifier</code>s.  Each <code>IRunNotifier</code> contain an <code>#addListener()</code>
	 * and <code>#removeListener</code> method that accetps an <code>IRunListener</code> as an argument.<br/>
	 * 
	 * If one writes an <code>IRunner</code>, they may need to notify FlexUnit4 of their progress while 
	 * running tests.  This is accomplished by invoking the <code>IRunNotifier</code> passed to the
	 * implementation of <code>org.flexunit.runner.IRunner#run(RunNotifier)</code>.
	 * 
	 * @see org.flexunit.runner.notification.IRunListener
	 */
	public interface IRunNotifier {
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that the test run has started.
		 * 
		 * @param description An <code>IDescription</code> of the top most <code>IRunner</code>.
		 */
		function fireTestRunStarted( description:IDescription ):void;
		
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that the test run has finished.
		 * 
		 * @param result The <code>Result</code> of the test run.
		 */
		function fireTestRunFinished( result:Result ):void;
		
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that an atomic test has started.
		 * 
		 * @param description An <code>IDescription</code> of the atomic test (generally a class 
		 * and method name).
		 */
		function fireTestStarted( description:IDescription ):void;
		
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that an atomic test failed.
		 * 
		 * @param failure The <code>Failure</code> indicating why the test ended up failing.
		 */
		function fireTestFailure( failure:Failure ):void;
		
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that an atomic test flagged 
		 * that it assumed something false.
		 * 
		 * @param failure The <code>Failure</code> indicating what 
		 * <code>AssumptionViolatedException</code> was thrown.
		 */
		function fireTestAssumptionFailed( failure:Failure ):void;
		
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that an atomic test was ignored.
		 * 
		 * @param description The <code>IDescription</code> of the ignored test.
		 */
		function fireTestIgnored( description:IDescription ):void;
		
		/**
		 * Invoke to tell all registered <code>IRunListener</code>s that an atomic test finished. Always invoke 
		 * <code>#fireTestFinished(IDescription)</code> if you invoke <code>#fireTestStarted(IDescription)</code> 
		 * as listeners are likely to expect them to come in pairs.
		 * 
		 * @param description The <code>IDescription</code> of the test that finished.
		 */
		function fireTestFinished( description:IDescription ):void;
		
		/**
		 * Adds an <code>IRunListener</code> to the list of registered listeners in the 
		 * <code>IRunNotifier</code>.
		 * 
		 * @param listener The <code>IRunListener</code> to add.
		 */
		function addListener( listener:IRunListener ):void;
		
		/**
		 * Adds <code>IRunListener</code> to the beginning of the list of registered listeners in the 
		 * <code>IRunNotifier</code>.
		 * 
		 * @param listener The <code>IRunListener</code> to add to the beginning.
		 */
		function addFirstListener( listener:IRunListener ):void;
		
		/**
		 * Removes an <code>IRunListener</code> from the list of registered listeners in the 
		 * <code>IRunNotifier</code>.
		 * 
		 * @param listener The <code>IRunListener</code> to remove.
		 */
		function removeListener( listener:IRunListener ):void;

		/**
		 * Removes all <code>IRunListener</code> instances from the list of registered listeners 
		 * in the <code>IRunNotifier</code>.
		 * 
		 */
		function removeAllListeners():void;
	}
}