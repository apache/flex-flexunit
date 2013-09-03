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
package org.flexunit.async.cases
{
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.async.mocks.ResponderMock;
	import org.flexunit.internals.runners.statements.mock.AsyncHandlingStatementMock;

	public class AsyncFlexCase
	{
		protected var asyncHandlingStatementMock:AsyncHandlingStatementMock;
		protected var testCase:Object;
		
		[Before(description="Prepare the environment for the Async test")]
		public function setUp():void {
			asyncHandlingStatementMock = new AsyncHandlingStatementMock();
			testCase = new Object();
			
			AsyncLocator.registerStatementForTest(asyncHandlingStatementMock, testCase);
		}
		
		[After(description="Reset the environment for the Async test")]
		public function tearDown():void {
			AsyncLocator.cleanUpCallableForTest(testCase);
			
			asyncHandlingStatementMock = null;
			testCase = null;
		}
		
		[Test(description="Ensure the asyncResponder function is correctly called")]
		public function asyncResponderTest():void {
			var responder:Object = new Object();
			var timeout:int = 700;
			var passThroughData:Object = new Object();
			var timeoutHandler:Function = new Function();
			var responderMock:ResponderMock = new ResponderMock();
			
			//Set expectations
			asyncHandlingStatementMock.mock.method("asyncResponder").withArgs(responder, timeout, passThroughData, timeoutHandler).once.returns(responderMock);

			Async.asyncResponder(testCase, responder, timeout, passThroughData, timeoutHandler);
			
			//Verify expectations were met
			asyncHandlingStatementMock.mock.verify();
		}
	}
}