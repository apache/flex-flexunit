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

	public class TestBeforeAfterInheritance extends TestBeforeAfterInheritanceBaseClass
	{
		public static var setupOrderArray:Array = new Array();

		[Before(order=1)]
		public function beginOne():void {
			setupOrderArray.push("third");
		}
		
		[Before(order=2)]
		public function beginTwo():void {
			setupOrderArray.push("fourth");
		}
		
		[Before(order=3)]
		public function beginThree():void {
			setupOrderArray.push("fifth");
		}
		
		//This depends on the test order also working, so we should always run this test after the method order has been verified
		[Test(order=1)]
		public function checkingBeforeOrder() : void {
			//4 begins
			if ( setupOrderArray.length == 5 ) {
				Assert.assertEquals( setupOrderArray[ 0 ], "first" );
				Assert.assertEquals( setupOrderArray[ 1 ], "second" );
				Assert.assertEquals( setupOrderArray[ 2 ], "third" );
				Assert.assertEquals( setupOrderArray[ 3 ], "fourth" );
				Assert.assertEquals( setupOrderArray[ 4 ], "fifth" );
			} else {
				Assert.fail("Incorrect number of begin calls");
			}
		}
		
		[Test(order=2)]
		public function checkingAfterOrder() : void {
			//5 begins
			//5 afters
			//5 more begins
			if ( setupOrderArray.length == 15 ) {
				Assert.assertEquals( setupOrderArray[ 5 ], "sixth" );
				Assert.assertEquals( setupOrderArray[ 6 ], "seventh" );
				Assert.assertEquals( setupOrderArray[ 7 ], "eight" );
				Assert.assertEquals( setupOrderArray[ 8 ], "nineth" );
				Assert.assertEquals( setupOrderArray[ 9 ], "tenth" );
			} else {
				Assert.fail("Incorrect number of after calls");
			}
		}

		[After(order=1)]
		public function afterOne():void {
			setupOrderArray.push("sixth");
		}
		
		[After(order=2)]
		public function afterTwo():void {
			setupOrderArray.push("seventh");
		}

		[After(order=3)]
		public function afterThree():void {
			setupOrderArray.push("eight");
		}

	}
}