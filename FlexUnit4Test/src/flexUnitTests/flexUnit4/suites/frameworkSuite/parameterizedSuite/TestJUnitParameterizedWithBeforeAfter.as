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
	public class TestJUnitParameterizedWithBeforeAfter
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
		}
		
		[Before]
		public function before() : void
		{
			++num;
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
			--num;
/*			trace( "after()" );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
			// Since [AfterClass] method shouldn't be called yet, and should be
			// called once per test run, these should be equivalent.
			Assert.assertEquals( num, afterCount - 1 );
		}
		
		[Parameters]
		public static var testDataOneIntParam:Array = [ [ 0 ], [ 1 ], [ 2 ] ];
		
		protected var num : int;
		
		[Test]
		public function parameterized_junit_verifyBeforeAfterAndBeforeAfterClass() : void
		{
			++testCount;
/*			trace( "parameterized_junit_verifyBeforeAfterAndBeforeAfterClass()" );
			trace( "num: ", num );
			trace( "beforeClassCount: ", beforeClassCount );
			trace( "beforeCount: ", beforeCount );
			trace( "testCount: ", testCount );
			trace( "afterCount: ", afterCount );
			trace( "afterClassCount: ", afterClassCount );
			trace();*/
			Assert.assertEquals( beforeClassCount, 1 );
			Assert.assertEquals( num, beforeCount );
			Assert.assertEquals( num, testCount );
			Assert.assertEquals( num, afterCount + 1 );
			Assert.assertEquals( afterClassCount, 0 );
		}
		
		public function TestJUnitParameterizedWithBeforeAfter( num : int )
		{
			this.num = num;
		}
	}
}