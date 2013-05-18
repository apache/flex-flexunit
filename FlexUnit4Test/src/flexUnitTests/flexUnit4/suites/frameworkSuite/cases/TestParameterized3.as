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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	import org.flexunit.runners.Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestParameterized3 {
		private var foo:Parameterized;

		[Parameters]
		public static function data1():Array {
			//need to deal with this circumstance better -> throw new Error("Blah");
			return [ [ 0, 0 ], [ 1, 2 ], [ 2, 4 ] ];
		}
		
		public static function dataTwo():Array {
			//need to deal with this circumstance better -> throw new Error("Blah");
			return [ [ 0, 0 ], [ 1, 2 ], [ 2, 4 ] ];
		}

		public static function dataThree():Array {
			//need to deal with this circumstance better -> throw new Error("Blah");
			return [ [ 0, 0 ], [ 1, 3 ], [ 2, 6 ] ];
		}
		
		[Test(dataProvider="dataTwo")]
		public function timesTwoTest( value:int, required:int ):void {
			assertEquals( 2*value, required );
		}

		[Test(dataProvider="dataThree")]
		public function timesThreeTest( value:int, required:int ):void {
			assertEquals( 3*value, required );
		}

		[Test]
		public function justARegularTest():void {
		}

		private var _input:int;
		private var _expected:int;
		
		public function TestParameterized3( param1:int, param2:int ) {
			_input = param1;
			_expected = param2;
		}
		
		[Test]
		public function doubleTest():void {
			Assert.assertEquals(_expected, _input*2);
		}
		
	}
}
