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

	public class AssertNotNullCase
	{
		[Test(description="Ensure the the assertNotNull function correctly works when a non-null value is provided")]
		public function shouldPassWhenNotNull():void {
			var o:Object = new Object();
			Assert.assertNotNull( o );
		}
		
		[Test(description="Ensure that the assertNotNull function correctly works when a non-null value and a message are provided")]
		public function shouldPassWhenNotNullWithCustomMessage():void {
			var o:Object = new Object();
			Assert.assertNotNull( "Assert not null fail", o );
		}
		
		[Test(description="Ensure that the assertNotNull function fails when a null value is provided")]
		public function shouldFailWhenNull():void {
			var failed:Boolean = false;
			var message:String;

			try {
				Assert.assertNotNull( null )
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
			}

			if ( !failed ) {
				Assert.fail( "Assert not null didn't fail" );
			}
			
			Assert.assertEquals( "object was null: null", message );
		}
		
		[Test(description="Ensure that the assertNotNull function fails when a null value is provided and the proper message is displayed")]
		public function shouldFailWhenNullWithCustomMessage():void {
			var failed:Boolean = false;
			var message:String;

			try {
				Assert.assertNotNull( "Yo Yo Yo", null )
				// if we get an error with the right message we pass
			} catch ( error:AssertionFailedError ) {
				failed = true;
				message = error.message;
			}

			if ( !failed ) {
				Assert.fail( "Assert not null didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo" + " - object was null: null", message );
		}
	}
}