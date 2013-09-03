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
	import org.flexunit.Assert;
	import org.flexunit.async.TestResponder;

	public class TestResponderCase
	{
		//TODO: Need to finish implementing this test case and confirm it's being implemented
		//correctly, this could be done with a mock
		
		protected var testResponder:TestResponder;
		protected var resultCalled:int;
		protected var faultCalled:int;
		
		[Before(description="Create an instance of the TestResponder")]
		public function createTestResponder():void {
			testResponder = new TestResponder(mockResult, mockFault);
			resultCalled = 0;
			faultCalled = 0;
		}
		
		[After(description="Destroy the instance of the TestResponder")]
		public function destroyTestResponder():void {
			testResponder = null;
			resultCalled = 0;
			faultCalled = 0;
		}
		
		[Test(description="Ensure the result function is correctly called")]
		public function resultTest():void {
			testResponder.result(new Object(), new Object());
			
			if(resultCalled != 1) {
				Assert.fail("The result function was not properly called");
			}
		}
		
		[Test(description="Ensure the fault function is correctly called")]
		public function faultTest():void {
			testResponder.fault(new Object(), new Object());
			
			if(faultCalled != 1) {
				Assert.fail("The fault function was not properly called");
			}
		}
		
		protected function mockResult(data:Object, passThroughData:Object):void {
			resultCalled++;
		}
		
		protected function mockFault(data:Object, passThroughData:Object):void {
			faultCalled++;
		}
	}
}