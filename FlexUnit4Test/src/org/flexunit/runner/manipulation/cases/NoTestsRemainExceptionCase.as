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
package org.flexunit.runner.manipulation.cases
{
	import org.flexunit.Assert;
	import org.flexunit.runner.manipulation.NoTestsRemainException;

	public class NoTestsRemainExceptionCase
	{
		//TODO: Ensure that this test case and the tests are correctly implemented
		
		[Test(description="Ensure the NoTestsReaminException class is correctly constructed with no parameters passed")]
		public function noParamAssertionErrorConstructorTest():void {
			var noTestsRemainException:NoTestsRemainException = new NoTestsRemainException();
			
			try {
				throw noTestsRemainException;
			} 
			catch(e:NoTestsRemainException) {
				Assert.assertEquals("", e.message);
				Assert.assertEquals(0, e.errorID);
			}
		}
		
		[Test(description="Ensure the NoTestsReaminException class is correctly constructed with a message parameter passed")]
		public function messageParamAssertionErrorConstructorTest():void {
			var testMessage:String = "testMessage";
			var noTestsRemainException:NoTestsRemainException = new NoTestsRemainException(testMessage);
			
			try {
				throw noTestsRemainException;
			} 
			catch(e:NoTestsRemainException) {
				Assert.assertEquals(testMessage, e.message);
				Assert.assertEquals(0, e.errorID);
			}
		}
		
		[Test(description="Ensure the NoTestsReaminException class is correctly constructed with a message and id parameter passed")]
		public function allParamAssertionErrorConstructorTest():void {
			var testMessage:String = "testMessage";
			var id:int = 216;			
			var noTestsRemainException:NoTestsRemainException = new NoTestsRemainException(testMessage, id);
			
			try {
				throw noTestsRemainException;
			} 
			catch(e:NoTestsRemainException) {
				Assert.assertEquals(testMessage, e.message);
				Assert.assertEquals(id, e.errorID);
			}
		}
	}
}