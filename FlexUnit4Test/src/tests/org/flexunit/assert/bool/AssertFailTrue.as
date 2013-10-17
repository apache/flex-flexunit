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
package tests.org.flexunit.assert.bool {
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	
	public class AssertFailTrue {

		[Test]
		public function shouldPass():void {
			Assert.failTrue( "Fail true fail", false );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFail():void {
			Assert.failTrue( "Blah", true );
		}

		[Test]
		public function shouldFailWithCustomMessage():void {
			var message:String;
			var failed:Boolean = false;
			
			try {
				Assert.failTrue( "Yo Yo Yo", true );
				// if we get an error with the right message we pass
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
			}

			if ( !failed ) {
				Assert.fail( "Fail true fail didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo" + " - expected false but was true", message );
		}
		
	}
}