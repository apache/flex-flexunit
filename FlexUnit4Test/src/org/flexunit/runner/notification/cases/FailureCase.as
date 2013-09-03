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
package org.flexunit.runner.notification.cases
{
	import com.anywebcam.mock.Mock;
	
	import flash.system.Capabilities;
	
	import org.flexunit.Assert;
	import org.flexunit.runner.Description;
	import org.flexunit.runner.mocks.DescriptionMock;
	import org.flexunit.runner.notification.Failure;

	public class FailureCase
	{
		//TODO: Ensure that the tests and this test case are being correctly implemented
		
		protected var descriptionMock:DescriptionMock
		protected var exception:Error;
		protected var failure:Failure;
		
		protected var message:String = "testMessage";
		protected var id:int = 729;
		
		[Before(description="Create an instance of the Failure Class")]
		public function createFailure():void {
			descriptionMock = new DescriptionMock();
			exception = new Error( message, id );
			failure = new Failure( descriptionMock, exception );
		}
		
		[After(description="Remove the reference to the Failure class")]
		public function destroyFailure():void {
			descriptionMock = null;
			exception = null;
			failure = null;
		}
		
		[Test(description="Ensure that the test header value is correctly obtained")]
		public function getTestHeaderTest():void {
			var displayName:String = "testDisplayName";
			descriptionMock.mock.property("displayName").returns(displayName);
			
			Assert.assertEquals( displayName, failure.testHeader );
		}
		
		[Test(description="Ensure that the description value is correctly obtained")]
		public function getDescriptionTest():void {
			Assert.assertEquals( descriptionMock, failure.description );
		}
		
		[Test(description="Ensure that the exception value is correctly obtained")]
		public function getExceptionTest():void {
			Assert.assertEquals( exception, failure.exception );
		}
		
		[Test(description="Ensure that the to string fucntion correctly operates")]
		public function toStringTest():void {
			var displayName:String = "testDisplayName";
			descriptionMock.mock.property("displayName").returns(displayName);
			
			Assert.assertEquals(displayName + ": " + message, failure.toString());
		}
		
		[Test(description="Ensure that the exception value is correctly obtained")]
		public function getMessageTest():void {
			Assert.assertEquals( message, failure.message );
		}
		
		//TODO: There needs to be a second tests created for when Capabilities.isDebugger returns a value of false, how would this
		//be properly implemented
		[Ignore]
		[Test(description="Ensure that the statck trace value is correctly obtained when the system is a debugging version")]
		public function getStackTraceDebuggerTest():void {
			Assert.assertEquals(exception.getStackTrace(), failure.stackTrace);
		}
	}
}