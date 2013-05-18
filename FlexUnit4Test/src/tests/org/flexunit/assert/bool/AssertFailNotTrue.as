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
	
	public class AssertFailNotTrue {
		[Test]
		public function shouldPassTrue():void {
			Assert.failNotTrue( "Fail not true fail", true );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailFalse():void {
			Assert.failNotTrue( "Fail not true fail", false );
		}

		[Test(description="Ensure that the failNotTrue function fails when a value of false is provided")]
		public function shouldFailWithCustomMessage():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.failNotTrue( "Yo Yo Yo", false );
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
			}
			
			if ( !failed ) {
				Assert.fail( "Fail not true fail didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo - expected true but was false", message );
		}
		
	}
}