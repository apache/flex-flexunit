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
	import flexunit.framework.TestCase;
	
	import org.flexunit.Assert;
	import org.flexunit.AssertionError;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.mock.AsyncHandlingStatementMock;

	public class AsyncLocatorCase
	{
		[Test(description="Ensure an IAsyncHandlingStatement is successfully registered to a TestCase")]
		public function registerStatementForTestTest():void {
			var asyncHandlingStatementMock:AsyncHandlingStatementMock = new AsyncHandlingStatementMock();
			var testCase:Object = new Object();
			
			AsyncLocator.registerStatementForTest(asyncHandlingStatementMock, testCase);
			
			Assert.assertEquals( asyncHandlingStatementMock, AsyncLocator.getCallableForTest(testCase) );
		}
		
		[Test(expected="org.flexunit.AssertionError",
			description="Ensure an AssertionError is thrown when no IAsyncHandlingStatement is returned for a given TestCase")]
		public function getCallableForNonExistingTestTest():void {
			AsyncLocator.getCallableForTest( new Object() );
		}
		
		//This test is not expecting an error in order to prevent the test from passing if the first getCallableForTest were to throw and error
		[Test(description="Ensure an IAsyncHandlingStatement is successfully removed for a given TestCase")]
		public function cleanUpCallableForTestTest():void {
			var asyncHandlingStatementMock:AsyncHandlingStatementMock = new AsyncHandlingStatementMock();
			var testCase:Object = new Object();
			
			AsyncLocator.registerStatementForTest(asyncHandlingStatementMock, testCase);
			
			//Verify that the object that implements the IAsyncHandlingStatement has been added successfully
			Assert.assertEquals( asyncHandlingStatementMock, AsyncLocator.getCallableForTest(testCase) );
			
			AsyncLocator.cleanUpCallableForTest(testCase);	
			
			//Try to retrieve the object that implements the IAsyncHandlingStatement for the now cleaned testCase, an error should be thrown
			try {
				AsyncLocator.getCallableForTest(testCase);
				Assert.fail("An error should have been thrown before this was called");
			} catch(e:AssertionError) {
				
			}
		}
	}
}