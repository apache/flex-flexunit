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
	import org.flexunit.internals.runners.statements.Fail;
	import org.flexunit.token.AsyncTestToken;

	public class FailCase
	{
		//TODO: Ensure that this test case has all needed tests and that the current tests are being
		//implemented correctly
		
		[Test(description="Ensure that the evaluate method is working correctly")]
		public function evaluteTest():void {
			var error:Error = new Error();
			var asyncTestToken:AsyncTestToken = new AsyncTestToken();
			var fail:Fail = new Fail(error);
			
			try {
				fail.evaluate(asyncTestToken);
			} catch(e:Error) {
				Assert.assertEquals(error, e);
			}
		}
	}
}