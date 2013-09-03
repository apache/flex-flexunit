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
package org.flexunit.internals.runners.statements.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.runners.statements.InvokeMethod;
	import org.flexunit.runners.model.mocks.FrameworkMethodMock;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.mocks.AsyncTestTokenMock;

	public class InvokeMethodCase
	{
		//TODO: Ensure that the tests and this test case are properly built
		
		protected var invokeMethod:InvokeMethod;
		protected var testMethod:FrameworkMethodMock;
		protected var target:Object;
		
		[Before(description="Create an instance of the InvokeMethod class")]
		public function createInvokeMethod():void {
			testMethod = new FrameworkMethodMock();
			target = new Object();
			invokeMethod = new InvokeMethod(testMethod, target);
		}
		
		[After(description="Remove the reference ot the InvokeMethod class")]
		public function desttroyInovkeMethod():void {
			invokeMethod = null;
			target = null;
			testMethod = null;
		}
		
		[Ignore("invokeExplosivelyAsync no longer exists")]
		[Test(description="Ensure that the evalute fucntion correctly works when no error is thrown")]
		public function evaluateSuccessTest():void {
			var parentToken:AsyncTestTokenMock = new AsyncTestTokenMock();
			
			testMethod.mock.method("invokeExplosivelyAsync").withArgs(AsyncTestToken, target).once;
			
			invokeMethod.evaluate(parentToken);
			
			testMethod.mock.verify();
		}
		
		[Ignore("invokeExplosivelyAsync no longer exists")]
		[Test(description="Ensure that the evalute fucntion correctly works when an error is thrown")]
		public function evaluateFailureTest():void {
			var parentToken:AsyncTestTokenMock = new AsyncTestTokenMock();
			var error:Error = new Error();
			
			testMethod.mock.method("invokeExplosivelyAsync").withArgs(AsyncTestToken, target).once.andThrow(error);
			parentToken.mock.method("sendResult").withArgs(error).once;
			
			invokeMethod.evaluate(parentToken);
			
			testMethod.mock.verify();
			parentToken.mock.verify();
		}
		
		[Test(description="Ensure that the toString method returns the appropriate string value")]
		public function toStringTest():void {
			var testName:String = "testName";
			
			testMethod.mock.property("name").returns(testName);
			
			Assert.assertEquals( "InvokeMethod " + testName, invokeMethod.toString());
		}
	}
}