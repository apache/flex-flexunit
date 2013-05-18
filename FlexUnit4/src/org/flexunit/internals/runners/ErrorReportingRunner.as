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
package org.flexunit.internals.runners {
	import org.flexunit.runner.Description;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IRunNotifier;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.IAsyncTestToken;
	
	/**
	 * Runner responsible for reproting errors encountered when attempting to initialize a class instead of running tests
	 */
	public class ErrorReportingRunner implements IRunner {
		/**
		 * @private
		 */
		private var _causes:Array;
		/**
		 * @private
		 */
		private var _testClass:Class;

		/**
		 * @private
		 */
		protected var stopRequested:Boolean = false;

		/**
		 * Constructor.
		 * 
		 * @param testClass The test class that generated the error
		 * @param cause The error that was generated when attempting to find a 
		 */
		public function ErrorReportingRunner( testClass:Class, cause:Error ) {
			_testClass = testClass;
			_causes = getCauses(cause);
		}

		/**
		 * Ask that the tests run stop before starting the next test. Phrased politely because
		 * the test currently running will not be interrupted. 
		 */
		public function pleaseStop():void {
			stopRequested = true;
		}		
		
		/**
		 * Describe the test class and add a child to it for each cause that was associated with the Error
		 * 
		 * @return an <code>IDescription</code> describing the provided test class with the causes of error associated
		 * with the test class
		 */
		public function get description():IDescription {
			var description:IDescription = Description.createSuiteDescription( _testClass );

			for ( var i:int=0; i<_causes.length; i++ ) {
				description.addChild( describeCause( _causes[ i ] ) );
			}

			return description;
		}
		
		/**
		 * Informs the notifier about each potential cause Error for the test class
		 * 
		 * @param notifier The notifer to notify about the cause Errors
		 * @param token A token that will be alerted when the notifer has been notified for each cause Error
		 */
		public function run( notifier:IRunNotifier, previousToken:IAsyncTestToken ):void {
			for ( var i:int=0; i<_causes.length; i++ ) {
				description.addChild( describeCause( _causes[ i ] ) );
				runCause( _causes[ i ], notifier );
			}
			
			//notify our parent that we are good to continue
			previousToken.sendResult();
		}
		
		/**
		 * Determines the causes that generated the provided error
		 * 
		 * @param cause The Error to inspect for its cause
		 */
		private function getCauses( cause:Error ):Array {
			/*
			TODO: Figure this whole mess out
			if (cause instanceof InvocationTargetException)
				return getCauses(cause.getCause());
			if (cause instanceof InitializationError)
				return ((InitializationError) cause).getCauses();
			if (cause instanceof org.junit.internal.runners.InitializationError)
				return ((org.junit.internal.runners.InitializationError) cause)
						.getCauses();
			return Arrays.asList(cause);
			*/
			
			if ( cause is InitializationError ) {
				return InitializationError(cause).getCauses();
			}
			
			return [ cause ];
		}

		/**
		 * @private 
		 * 
		 */
		private function describeCause( child:Error ):IDescription {
			return Description.createTestDescription( _testClass, "initializationError");
		}
		
		/**
		 * Report to the notifier about the specific cause Error
		 * 
		 * @param child The cause Error to report to the notifier
		 * @param notifier The notifier that is notified about the cause Error
		 */
		private function runCause( child:Error, notifier:IRunNotifier ):void {
			var description:IDescription = describeCause(child);
			notifier.fireTestStarted( description );
			notifier.fireTestFailure( new Failure(description, child) );
			notifier.fireTestFinished( description );
		}
	}
}