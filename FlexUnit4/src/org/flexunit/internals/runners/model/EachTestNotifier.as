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
package org.flexunit.internals.runners.model {
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IRunNotifier;
	
	/**
	 * The <code>EachTestNotifier</code> is responsible for instructing a provided
	 * <code>IRunNotifier</code> about the execution of a specific test.  The 
	 * <code>EachTestNotifier</code> is provided with an <code>IRunNotifier</code>
	 * and a corresponding <code>IDescription</code> of the test that is to be
	 * executed.  It will report to the <code>IRunNotifier</code> as it is notified
	 * about the execution of the test, providing the necessary description or failure
	 * to the <code>IRunNotifier</code>.
	 */
	public class EachTestNotifier {
		/**
		 * @private
		 */
		private var notifier:IRunNotifier;
		/**
		 * @private
		 */
		private var description:IDescription;
		
		/** 
		 * Constructor. 
		 * 
		 * @param notifier The <code>IRunNotifier</code> to notify regarding the execution of a specific test.
		 * @param description An <code>IDescription</code> of the current test.
		 */
		public function EachTestNotifier( notifier:IRunNotifier, description:IDescription ) {
			this.notifier = notifier;
			this.description = description;
		}
		
		/** 
		 * Instructs the notifier that the test method has encountered a failure.
		 * 
		 * @param targetException The exception that was thrown when running the test method.
		 */
		public function addFailure( targetException:Error ):void {
			//If the targetException is a MultipleFailureException, notify the notifier for each failure
			if (targetException is MultipleFailureException) {
				var  mfe:MultipleFailureException = MultipleFailureException( targetException );
				var failures:Array = mfe.failures;
				for ( var i:int=0; i<failures.length; i++ ) {
					addFailure( failures[ i ] );
				}
				return;
			}
			notifier.fireTestFailure(new Failure( description, targetException));
		}

		//TODO: THis needs to be an AssumptionViolatedException... but I need to get Hamcrest in there for that...so it needs to wait
		/** 
		 * Instructs the notifier that the test method has failed an assumption.
		 * 
		 * @param error The assumption that was violated when running the test method.
		 */
		public function addFailedAssumption( error:Error ):void {
			notifier.fireTestAssumptionFailed( new Failure( description, error ) );
		}
		
		/** 
		 * Instructs the notifier that the test method has finished running.
		 */
		public function fireTestFinished():void {
			notifier.fireTestFinished(description);
		}
		
		/** 
		 * Instructs the notifier that the test method has started.
		 */
		public function fireTestStarted():void {
			notifier.fireTestStarted(description);
		}
	
		/** 
		 * Instructs the notifier that the test method has been ignored.
		 */
		public function fireTestIgnored():void {
			notifier.fireTestIgnored(description);
		}
	}
}