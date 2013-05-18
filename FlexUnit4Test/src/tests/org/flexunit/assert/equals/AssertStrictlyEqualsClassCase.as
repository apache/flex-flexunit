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
package tests.org.flexunit.assert.equals
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;

	public class AssertStrictlyEqualsClassCase
	{
		[Test(description="Ensure that the assertStrictlyEquals function correctly determines if two values are strictly equal")]
		public function shouldPassWhenSameObject():void {
			var o:Object = new Object();
			Assert.assertStrictlyEquals( o, o );
		}
		
		[Test(description="Ensure that the assertStrictlyEquals function correctly determines if two values are strictly equal when a message is provided")]
		public function shouldPassWhenSameObjectWithCustomMessage():void {
			var o:Object = new Object();
			Assert.assertStrictlyEquals( "Assert strictly equals fail", o, o );
		}
		
		[Test(description="Ensure that the assertStrictlyEquals function fails when two items are not strictly equal")]
		public function shouldFailToConvertBetweenStringAndNumber():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.assertStrictlyEquals( 5, "5" );
			} catch (error:AssertionFailedError) {
				failed = true;
				message = error.message;				
			}
			
			if ( !failed ) {
				Assert.fail( "Assert strictly equals didn't fail" );
			}
			
			Assert.assertEquals( "expected:<5> but was:<5>", message );
		}

/*		
		I need to investigate why flash player sees these two as strictly equal
		[Test(description="Ensure that the assertStrictlyEquals function fails when two items are not strictly equal")]
		public function shouldFailToConvertBetweenIntAndNumber():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.assertStrictlyEquals( int( 5 ), Number( 5.00 ) );
			} catch (error:AssertionFailedError) {
				failed = true;
				message = error.message;				
			}
			
			if ( !failed ) {
				Assert.fail( "Assert strictly equals didn't fail" );
			}
			
			Assert.assertEquals( "expected:<5> but was:<5>", message );
		}*/
		
		[Test(description="Ensure that the assertStrictlyEquals function fails when two items are not strictly euqal and the proper passed message is displayed")]
		public function shouldFailWithCustomMessage():void {
			var message:String;
			var failed:Boolean = false;
			
			try {
				Assert.assertStrictlyEquals( "Yo Yo Yo", 5, "5" );
				// if we get an error with the right message we pass
			} catch (error:AssertionFailedError) {
				failed = true;
				message = error.message;
				
			}
			if ( !failed ) {
				Assert.fail( "Assert strictly equals didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo" + " - expected:<5> but was:<5>", message );
		}
	}
}