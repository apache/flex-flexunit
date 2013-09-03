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
	public class TestJUnitParameterizedFuncVsArrayDataProvider
	{
		[Parameters]
		public static var testDataOneIntParam:Array = [ [ 0 ], [ 1 ], [ 2 ] ];
		
		[Parameters]	
		public static function testFuncOneIntParam() : Array
		{
			return new Array( [ 3 ], [ 4 ], [ 5 ] );
		}
		
		[Parameters]
		public static var testDataOneIntParam2:Array = [ [ 6 ], [ 7 ], [ 8 ] ];
		
		private var foo : Parameterized;
		
		protected var num : int;
		
		[Test]
		public function parameterized_testng_verifyArray() : void
		{
			// TODO: WRITE LEGIT TEST
			Assert.assertTrue( true );
		}
		
		public function TestJUnitParameterizedFuncVsArrayDataProvider( num : int )
		{
			this.num = num;
		}
	}
}