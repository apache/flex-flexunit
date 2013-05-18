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
package flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite
{
	import flexunit.framework.Assert;

	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class TestTheoriesWithBeforeAfter
	{
		public static var testCount : int = 0;
		public static var beforeClassCount : int = 0;
		public static var beforeCount : int = 0;
		public static var afterCount : int = 0;
		public static var afterClassCount : int = 0;
		
		[DataPoints]
		[ArrayElementType("int")]
		public static var intValues:Array = [0,1,2,3,4,5,6,7,8,9];
		
		[BeforeClass]
		public static function beforeClass() : void
		{
			++beforeClassCount;
			//trace( "beforeClassCount: ", beforeClassCount );
		}
		
		[AfterClass]
		public static function afterClass() : void
		{
			++afterClassCount;
			//trace( "afterClassCount: ", afterClassCount );
		}
		
		[Before]
		public function before() : void
		{
			++beforeCount;
			//trace( "beforeCount: ", beforeCount );
		}
		
		[After]
		public function after() : void
		{
			++afterCount;
			//trace( "afterCount: ", afterCount );
		}
		
		[Theory]
		public function theories_verifyBeforeAfterAndClass( value : int ) : void
		{
			Assert.assertEquals( value, testCount );
			Assert.assertEquals( value + 1, beforeCount );
			Assert.assertEquals( value, afterCount );
			Assert.assertEquals( beforeClassCount, 1 );
			Assert.assertEquals( afterClassCount, 0 );
			++testCount;
			//trace( "testCount: ", testCount );
		}
	}
}