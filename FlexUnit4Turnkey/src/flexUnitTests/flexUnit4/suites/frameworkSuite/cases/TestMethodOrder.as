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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;

    /**
     * @private
     */
	public class TestMethodOrder {
		protected static var testUnassignedComplete:Boolean = false;
		protected static var testOneComplete:Boolean = false;
		protected static var testTwoComplete:Boolean = false;
		protected static var testThreeComplete:Boolean = false;
		protected static var testFourComplete:Boolean = false;
		protected static var testNinetyComplete:Boolean = false;

		
		[Test]
		public function testOrderUnassigned() : void {
			testUnassignedComplete = true
			
			Assert.assertFalse( testOneComplete );
			Assert.assertFalse( testTwoComplete );
			Assert.assertFalse( testThreeComplete );
			Assert.assertFalse( testFourComplete );
			Assert.assertFalse( testNinetyComplete );
		}
		
		[Test(order=1)]
	    public function testOrderOne() : void {
	    	testOneComplete = true;
	    	
			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertFalse( testTwoComplete );
	    	Assert.assertFalse( testThreeComplete );
	    	Assert.assertFalse( testFourComplete );
	    	Assert.assertFalse( testNinetyComplete );
	    }

		[Test(order=2)]
	    public function testOrderTwo() : void {
	    	testTwoComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertFalse( testThreeComplete );
	    	Assert.assertFalse( testFourComplete );
	    	Assert.assertFalse( testNinetyComplete );

	    }

		[Test(order=4)]
	    public function testOrderFour() : void {
	    	testFourComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertTrue( testTwoComplete );
	    	Assert.assertTrue( testThreeComplete );
	    	Assert.assertFalse( testNinetyComplete );

	    }

		[Test(order=90)]
	    public function testOrderNinety() : void {
	    	testNinetyComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertTrue( testTwoComplete );
	    	Assert.assertTrue( testThreeComplete );
	    	Assert.assertTrue( testFourComplete );

	    }

		[Test(order=3)]
	    public function testOrderThree() : void {
	    	testThreeComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertTrue( testTwoComplete );
	    	Assert.assertFalse( testFourComplete );
	    	Assert.assertFalse( testNinetyComplete );

	    }
	}
}