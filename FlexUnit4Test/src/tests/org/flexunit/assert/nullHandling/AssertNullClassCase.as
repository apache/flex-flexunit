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
package tests.org.flexunit.assert.nullHandling
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;

	public class AssertNullClassCase
	{
		[Test(description="Ensure that the assertNull function correctly works when a value of null is provided")]
		public function shouldPassWhenNull():void {
			Assert.assertNull( null );
		}
		
		[Test(description="Ensure that the assertNull function correctly works when a value of null and a message are provided")]
		public function shouldPassWhenNullWithCustomMessage():void {
			Assert.assertNull( "Assert null fail", null );
		}
		
		[Test(description="Ensure that the assertNull function fails when a non-null value is provided")]
		public function shouldFailWhenNotNull():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.assertNull( new Object() )
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
				
			}
			
			if ( !failed ) {
				Assert.fail( "Assert null didn't fail" );
			}
			
			Assert.assertEquals( "object was not null: [object Object]", message );
		}
		
		[Test(description="Ensure that the assertNull functions fails when a non-null value is provided an the proper message is displayed")]
		public function shouldFailWhenNotNullWithCustomMessage():void {
			var failed:Boolean = false;
			var message:String;

			try {
				Assert.assertNull( "Yo Yo Yo", new Object() )
				// if we get an error with the right message we pass
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
			}
			
			if ( !failed ) {
				Assert.fail( "Assert null didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo" + " - object was not null: [object Object]", message );
		}
	}
}