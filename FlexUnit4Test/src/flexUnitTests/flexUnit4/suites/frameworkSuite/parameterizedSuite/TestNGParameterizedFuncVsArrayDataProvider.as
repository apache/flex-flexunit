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
	public class TestNGParameterizedFuncVsArrayDataProvider
	{
		protected static var testRunArrayCount : int = 0;
		protected static var testRunFuncCount : int = 0;
		
		public static var testDataOneIntParam:Array = [ [ 0 ], [ 1 ], [ 2 ] ];
		
		public static function testFuncOneIntParam() : Array
		{
			return new Array( [ 0 ], [ 1 ], [ 2 ] );
		}
		
		private var foo : Parameterized;
		
		[Test(dataProvider="testDataOneIntParam")]
		public function parameterized_testng_verifyArray( num : int ) : void
		{
			Assert.assertEquals( num, testRunArrayCount );
			++testRunArrayCount;
		}
		
		[Test(dataProvider="testFuncOneIntParam")]
		public function parameterized_testng_verifyFunc( num : int ) : void
		{
			Assert.assertEquals( num, testRunFuncCount );
			++testRunFuncCount;
		}
	}
}