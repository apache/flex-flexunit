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
package tests.org.flexunit.token
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;

	public class ChildResultCase
	{
		[Test]
		public function shouldReturnProvidedToken():void {
			var token:AsyncTestToken = new AsyncTestToken();
			var childResult:ChildResult = new ChildResult( token );
			
			assertStrictlyEquals( token, childResult.token );
			assertNull( childResult.error );
		}
		
		[Test]
		public function shouldReturnProvidedError():void {
			var error:Error = new Error();
			var childResult:ChildResult = new ChildResult( null, error );
			
			assertStrictlyEquals( error, childResult.error );
			assertNull( childResult.token );
		}
	}
}