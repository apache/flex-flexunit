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
	
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.helper.ParamDataExt;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.helper.ParamDataHelper;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	import org.flexunit.runners.Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestParameterized2 {
		private var foo:Parameterized;
		
		public static var dataTwo:ParamDataExt = new ParamDataExt( "someFakeDataPath.stuff" );

		public static var helper:ParamDataHelper = new ParamDataHelper( "TestParameterized2.stuff" );

		[DataPoints(loader="helper")]
		public static var dataFour:Array;

		public static function dataThree():Array {
			//need to deal with this circumstance better -> throw new Error("Blah");
			return [ [11,22,33], [ 0, 1, 1 ], [ 1, 2, 3 ], [ 2, 4, 6 ] ];
		}
		
		[Test(dataProvider="dataTwo")]
		public function timesTwoTest( value:int, result:int ):void {
			assertEquals( 2*value, result );
		}

		[Test(dataProvider="dataFour")]
		public function timesFourTest( value:int, result:int ):void {
			assertEquals( 2*value, result );
		}
		
		[Test(dataProvider="dataThree",order="23")]
		public function addTwoValuesTest( value1:int, value2:int, result:int ):void {
			//trace( value1, ' ', value2, ' ', result );
			assertEquals( value1 + value2, result );
		}

		[Test]
		public function justARegularTest():void {
		}

	}
}
