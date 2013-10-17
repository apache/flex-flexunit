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
	public class TestBeforeAfterClassOrder {
		protected static var setupOrderArray:Array = new Array();

		[BeforeClass]
		public static function beginNoOrder():void {
			setupOrderArray.push( "beginNoOrder" );
		}

		[BeforeClass(order=1)]
		public static function beginOne():void {
			setupOrderArray.push( "beginOne" );
		}

		[BeforeClass(order=70)]
		public static function beginSeventy():void {
			setupOrderArray.push( "beginSeventy" );
		}

		[BeforeClass(order=2)]
		public static function beginTwo():void {
			setupOrderArray.push( "beginTwo" );
		}

		[AfterClass]
		public static function afterNoOrder():void {
			setupOrderArray.push( "afterNoOrder" );
			if ( setupOrderArray.length != 5 ) {
				Assert.fail( "Incorrect order of AfterClass calls" + setupOrderArray.length);
			}
		}

		[AfterClass(order=1)]
		public static function afterOne():void {
			setupOrderArray.push( "afterOne" );
			if ( setupOrderArray.length != 6 ) {
				Assert.fail( "Incorrect order of AfterClass calls" );
			}
		}

		[AfterClass(order=2)]
		public static function afterTwo():void {
			setupOrderArray.push( "afterTwo" );
			if ( setupOrderArray.length != 7 ) {
				Assert.fail( "Incorrect order of AfterClass calls" );
			}
		}

		[AfterClass(order=8)]
		public static function afterEight():void {
			setupOrderArray.push( "afterEight" );
			if ( setupOrderArray.length != 8 ) {
				Assert.fail( "Incorrect order of AfterClass calls" );
			}
		}

		[AfterClass(order=30)]
		public static function afterThirty():void {
			setupOrderArray.push( "afterThirty" );
			if ( setupOrderArray.length != 9 ) {
				Assert.fail( "Incorrect order of AfterClass calls" );
			}
		}

		//This depends on the test order also working, so we should always run this test after the method order has been verified
		[Test(order=1)]
	    public function checkingBeforeOrder() : void {
	    	//4 begins
	    	if ( setupOrderArray.length == 4 ) {
	    		Assert.assertEquals( setupOrderArray[ 0 ], "beginNoOrder" );
	    		Assert.assertEquals( setupOrderArray[ 1 ], "beginOne" );
	    		Assert.assertEquals( setupOrderArray[ 2 ], "beginTwo" );
	    		Assert.assertEquals( setupOrderArray[ 3 ], "beginSeventy" );
	    	} else {
	    		Assert.fail("Incorrect number of begin calls");
	    	}
	    }

		[Test(order=2)]
	    public function checkingAfterOrder() : void {
	    	//4 begins
	    	//0 afters at this point
	    	//unlike the other tests for before and after, with BeforeClass and AfterClass, we need to ensure they did *not* run again before this method
	    	checkingBeforeOrder();
	    }
		
	}
}