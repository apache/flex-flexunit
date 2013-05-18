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
	public class TestNGParameterizedWithBeforeAfter
	{
		public static var beforeClassCount : int = 0;
		public static var afterClassCount : int = 0;
		public static var beforeCount : int = 0;
		public static var afterCount : int = 0;
		public static var testCount : int = 0;
		
		private var foo : Parameterized;
		
		[BeforeClass]
		public static function beforeClass() : void
		{
			++beforeClassCount;
/*			trace( "beforeClass()" );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
		}
		
		[AfterClass]
		public static function afterClass() : void
		{
			++afterClassCount;
/*			trace( "afterClass()" );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
			Assert.assertEquals( testCount, 3 );
			Assert.assertEquals( afterClassCount, 1 );
		}
		
		[Before]
		public function before() : void
		{
			++beforeCount;
/*			trace( "before()" );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
		}
		
		[After]
		public function after() : void
		{
			++afterCount;
			// Since [AfterClass] method shouldn't be called yet, and should be
			// called once per test run, these should be equivalent.
/*			trace( "after()" );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
			Assert.assertEquals( afterCount, testCount );
		}
		
		public static var testDataOneIntParam:Array = [ [ 0 ], [ 1 ], [ 2 ] ];
		
		[Test(dataProvider="testDataOneIntParam")]
		public function parameterized_testng_verifyBeforeClass( num : int ) : void
		{
			++testCount;
/*			trace( "parameterized_testng_verifyBeforeClass()" );
			trace( "num: ", num );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
			Assert.assertEquals( beforeClassCount, 1 );
			Assert.assertEquals( num + 1, beforeCount );
			Assert.assertEquals( num + 1, testCount );
			Assert.assertEquals( num, afterCount );
			Assert.assertEquals( afterClassCount, 0 );
		}
	}
}