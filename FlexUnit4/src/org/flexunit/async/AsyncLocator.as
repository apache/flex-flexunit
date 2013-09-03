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
package org.flexunit.async {
	import flash.utils.Dictionary;
	
	import org.flexunit.AssertionError;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	
	/**
	 * The <code>AsyncLocator</code> is used to keep track of test cases that have implemented asynchronous 
	 * functionality.  The test cases are registered with the <code>AsyncLocator</code> and reference an
	 * object that implements <code>IAsyncHandlingStatement</code>.  Test cases are registered using the
	 * method <code>#registerStatementForTest()</code>.<br/>
	 * 
	 * The <code>IAsyncHandlingStatement</code> is then retrieved using the method <code>#getCallableForTest()</code>
	 * and providing the test case.  If a test case has not been registered, an <code>AssertionError</code> will be
	 * thrown.<br/>
	 * 
	 * Once an asynchronous test has completed, the method <code>#cleanUpCallableForTest</code> should be called in 
	 * order to disassociate the test case and the <code>IAsyncHandlingStatement</code>.
	 * 
	 * @see org.flexunit.async.Async
	 */
	public class AsyncLocator {
		/**
		 * @private
		 */
		private static var asyncHandlerMap:Dictionary = new Dictionary();
		
		/**
		 * Registers the <code>expectAsyncInstance</code> with the provided <code>testCase</code>.
		 * 
		 * @param expectAsyncInstance the <code>IAsyncHandlingStatement</code> to be registered.
		 * @param testCase The test case to associate with the particular <code>expectAsyncInstance</code>.
		 */
		public static function registerStatementForTest( expectAsyncInstance:IAsyncHandlingStatement, testCase:Object ):void {
			var monitor:StatementDependencyMonitor = getDependencyMonitor( testCase );
			
			if ( !monitor ) {
				monitor = createDependencyMonitor( testCase, expectAsyncInstance );
			}

			monitor.addDependency();
		} 
		
		/**
		 * Retrieves the <code>IAsyncHandlingStatement</code> for the provided <code>testCase</code>.  If no 
		 * <code>IAsyncHandlingStatement</code> has been registered for the <code>testCase</code>, an 
		 * <code>AssertionError</code> will be thrown.
		 * 
		 * @param testCase The test case used to retrieve the <code>IAsyncHandlingStatement</code>.
		 * 
		 * @return an <code>IAsyncHandlingStatement</code> associated with the <code>testCase</code>.
		 * 
		 * @throws org.flexunit.AssertionError Thrown if an <code>IAsyncHandlingStatement</code> was not registered
		 * for the provided <code>testCase</code>.
		 */
		public static function getCallableForTest( testCase:Object ):IAsyncHandlingStatement {
			var monitor:StatementDependencyMonitor = getDependencyMonitor( testCase );
			
			//If no handler was obtained from the dictionary, the test case was never marked as asynchronous, throw an AssertionError
			if ( !monitor ) {
				//TODO: Refactor this to some other type of error
				throw new AssertionError("Cannot add asynchronous functionality to methods defined by Test,Before or After that are not marked async");	
			}

			var handler:IAsyncHandlingStatement = monitor.statement;

			return handler;
		} 

		public static function hasCallableForTest( testCase:Object ):Boolean {
			var monitor:StatementDependencyMonitor = getDependencyMonitor( testCase );
			
			return ( monitor != null );
		} 

		/**
		 * Removes the registration for the <code>IAsyncHandlingStatement</code> that was associated with the
		 * provided <code>testCase</code>.
		 * 
		 * @param testCase The test case to remove the association with the <code>IAsyncHandlingStatement</code>.
		 */
		public static function cleanUpCallableForTest( testCase:Object ):void {
			var monitor:StatementDependencyMonitor = getDependencyMonitor( testCase );
			
			if (!monitor) {
				trace("Yo");
			}
			monitor.removeDependency();
			
			if ( monitor.complete ) {
				removeDependencyMonitor( testCase );
			}
		} 
		
		private static function getDependencyMonitor( testCase:Object ):StatementDependencyMonitor {
			return asyncHandlerMap[ testCase ];
		}

		private static function createDependencyMonitor( testCase:Object, statement:IAsyncHandlingStatement ):StatementDependencyMonitor {
			var monitor:StatementDependencyMonitor = new StatementDependencyMonitor( statement );
			asyncHandlerMap[ testCase ] = monitor;
			return monitor;
		}

		private static function removeDependencyMonitor( testCase:Object ):void {
			delete asyncHandlerMap[ testCase ];
		}

	}
}
import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;

class StatementDependencyMonitor { 
	private var dependencyCount:int = 0;
	private var _statement:IAsyncHandlingStatement;
	
	public function StatementDependencyMonitor( statement:IAsyncHandlingStatement ) {
		_statement = statement;
	} 

	public function addDependency():void {
		dependencyCount++;
	}
	
	public function removeDependency():void {
		dependencyCount--;	
	}
	
	public function get statement():IAsyncHandlingStatement {
		return _statement;
	}

	public function get complete():Boolean {
		return ( dependencyCount == 0 );
	}
}
