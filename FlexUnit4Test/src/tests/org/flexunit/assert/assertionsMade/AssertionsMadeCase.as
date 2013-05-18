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
package tests.org.flexunit.assert.assertionsMade {
	import org.flexunit.Assert;

	public class AssertionsMadeCase {
		[Test(description="Ensure that the assertionsMade property returns the correct assertCount")]
		public function shouldShowOneAssertionMade():void {
			var count:int = Assert.assertionsMade;
			//Reset the fields to ensure the the count is accurate
			Assert.assertEquals( 0, 0 );
			Assert.assertEquals( count + 1, Assert.assertionsMade );
		}
		
		[Test(description="Ensure that the resetAssertionsFields function correctly resets the assertCount")]
		public function shouldResetAssertionsMadeToZero():void {
			var count:int = Assert.assertionsMade;
			
			//Ensure that the number of assertions are greater than zero
			Assert.assertEquals( 0, 0 );			
			Assert.assertTrue( Assert.assertionsMade > 0 );
			
			//Reset the assertions
			Assert.resetAssertionsFields();
			
			Assert.assertEquals( Assert.assertionsMade, 0 );
			
			Assert._assertCount = count + 1;
		}
		
	}
}