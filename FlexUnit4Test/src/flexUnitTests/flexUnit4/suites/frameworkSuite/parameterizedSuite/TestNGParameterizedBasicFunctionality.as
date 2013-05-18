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
package flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite
{
	import flexunit.framework.Assert;
	
	import org.flexunit.runners.Parameterized;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestNGParameterizedBasicFunctionality
	{
		public static var numTestCalls : int = 0;
		
		private var foo : Parameterized;
		
		public static var testDataTwoParams:Array = [ [ "string1", 1 ], 
													  [ "string2", 2 ],
													  [ "string3", 3 ] ];
		
		public static var testDataOneStringParam:Array = [ [ "string4" ], [ "string6" ], [ "string8" ] ];
		
		public static var testDataOneIntParam:Array = [ [ 0 ], [ 1 ], [ 2 ] ];
		
		[Test(dataProvider="testDataTwoParams")]
		public function parameterized_testNG_standardUse( str : String, num : int ) : void
		{
			Assert.assertTrue( str.indexOf( num.toString() ) > 0 );
		}
		
		[Test(dataProvider="testDataOneIntParam")]
		public function parameterized_testNG_verifyArrayOrder( num : int ) : void
		{
			Assert.assertEquals( num, numTestCalls );
			++numTestCalls;
			//NOTE: If we replace the code above with the code below, the test fails!
			//numTestCalls++;
		}
		
		[Ignore]
		[Test(dataProvider="testDataOneIntParam")]
		public function parameterized_testNG_verifyIgnore( num : int ) : void
		{
			Assert.assertTrue( false );
		}
	}
}