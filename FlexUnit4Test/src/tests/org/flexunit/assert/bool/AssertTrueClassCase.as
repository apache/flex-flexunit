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
package tests.org.flexunit.assert.bool
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	
	public class AssertTrueClassCase
	{
		[Test(description="Ensure that the assertTrue function correctly works when a true value is provided")]
		public function shouldPassWhenTrue():void {
			Assert.assertTrue( true );
		}
		
		[Test(description="Ensure that the assertTrue function correctly works when a true value and a message are provided")]
		public function shouldPassWhenTrueWithCustomMessage():void {
			Assert.assertTrue( "Assert true fail", true );
		}
		
		[Test(description="Ensure that the assertTrue function fails when a false value is provided")]
		public function shouldFailWhenFalse():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.assertTrue( false )
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
			}

			if ( !failed ) {
				Assert.fail( "Assert true didn't fail" );
			}

			Assert.assertEquals( "expected true but was false", message );
		}
		
		[Test(description="Ensure that the assertTrue functions fails when a false value is provided and the proper passed message is displayed")]
		public function shouldFailWhenFalseWithCustomMessage():void {
			var message:String;
			var failed:Boolean = false;
			
			try {
				Assert.assertTrue( "Yo Yo Yo", false )
				// if we get an error with the right message we pass
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;				
			}

			if ( !failed ) {
				Assert.fail( "Assert true didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo" + " - expected true but was false", message );
		}
	}
}