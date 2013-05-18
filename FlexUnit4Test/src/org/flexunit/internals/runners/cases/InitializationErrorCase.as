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
package org.flexunit.internals.runners.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.runners.InitializationError;

	public class InitializationErrorCase
	{
		//TODO: Ensure that these tests and test case are being implemented correctly
		
		[Test(description="Ensure that the error array is successfully retrived")]
		public function getCausesErrorArrayTest():void {
			var errorArray:Array = new Array(new Error(), new Error(), new Error());
			var initilizationError:InitializationError = new InitializationError(errorArray);
			
			Assert.assertEquals(errorArray, initilizationError.getCauses());
		}
		
		[Test(description="Ensure that an error array contains an error that has the type based on the provided string")]
		public function getCausesStringTest():void {
			var testMessage:String = "testMessage";
			var initilizationError:InitializationError = new InitializationError(testMessage);
			
			var error:Error = initilizationError.getCauses()[0] as Error;
			Assert.assertEquals(testMessage, error.message);
		}
		
		[Test(description="Ensure that the error array contains the error")]
		public function getCausesErrorTest():void {
			var error:Error = new Error();
			var initilizationError:InitializationError = new InitializationError(error);
			
			Assert.assertEquals(error, initilizationError.getCauses()[0] as Error);
		}
	}
}