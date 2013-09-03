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
package tests.org.flexunit.assert.equals {
	import org.flexunit.Assert;

	public class AssertFailNotStrictlyEqual {
		[Test(description="Ensure that the failNotEquals function correctly determines if two non-strictly equal values are equal")]
		public function shouldPassAsSameObject():void {
			var o:Object = new Object();
			Assert.failNotEquals( "Failure", o, o );
		}
		
		[Test(exptects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithConversion():void {
			Assert.failNotEquals( "Failure", "5", 5 );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFail():void {
			Assert.failNotEquals( "Failure", 2, 4 );
		}
		
		[Test]
		public function shouldFailWithProperMessage():void {
			var fail:Boolean = false;
			var message:String;
			
			try {
				Assert.failNotEquals( "Yo Yo Yo", 2, 4 );
			}
			catch ( error:Error ) {
				fail = true;
				message = error.message;
			}
			
			Assert.assertTrue( "Did not fail as expected", fail );
			Assert.assertEquals( "Yo Yo Yo" + " - expected:<2> but was:<4>", message );
		}

	}
}