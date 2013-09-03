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
package tests.org.flexunit.assert.absolute {
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	import org.flexunit.AssertionError;
	import org.flexunit.asserts.fail;
	
	public class FailCase {
		[Test(description="Ensure that the function correctly throws an AssertionFailedError and sends the proper message")]
		public function shouldFailFunctionWithCustomMessage():void {
			var message:String;;
			var failed:Boolean = false;
			
			try {
				fail( "Yo Yo Yo" );
			} catch(error:AssertionFailedError) {
				failed = true;
				message = error.message;
			}

			if(!failed) {
				Assert.fail("The fail function has failed");
			}
			
			Assert.assertEquals( "Yo Yo Yo", message );			
		}
		
		[Test(description="Ensure that the function correctly throws an AssertionFailedError and sends the proper message")]
		public function shouldFailStaticClassWithCustomMessage():void {
			var message:String;;
			var failed:Boolean = false;
			
			try {
				Assert.fail( "Yo Yo Yo" );
			} catch(error:AssertionFailedError) {
				failed = true;
				message = error.message;
			}
			
			if(!failed) {
				//better throw this instead of use the fail function :)
				throw new AssertionError( "The Assert.fail function has failed" );
				//Assert.fail("The fail function has failed");
			}
			
			Assert.assertEquals( "Yo Yo Yo", message );			
		}
	}
}