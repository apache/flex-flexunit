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
package suite.cases {
	import math.SimpleMath;
	
	import org.flexunit.Assert;
	import org.flexunit.assumeThat;
	import org.hamcrest.number.greaterThan;
	
	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class MyTheory {

		private var simpleMath:SimpleMath;

		[DataPoints]
		[ArrayElementType("String")]
		public static var stringValues:Array = ["one","two","three","four","five"];
		
		[DataPoint]
		public static var values1:int = 2;
		[DataPoint]
		public static var values2:int = 4;
		
		[DataPoints]
		[ArrayElementType("int")]
		public static function provideData():Array {
			return [-10, 0, 2, 4, 8, 16 ];
		}
		
		[Theory]
		public function testDivideMultiply( value1:int, value2:int ):void {
			assumeThat( value2, greaterThan( 0 ) );
			
			var div:Number = simpleMath.divide( value1, value2 );
			var mul:Number = simpleMath.multiply( div, value2 );
			
			Assert.assertEquals( mul, value1 );
		}		
		
		[Theory]
		public function testStringIntCombo( value:int, stringValue:String ):void {			
			//call some method which requires an int and a string and make sure it works :)
		}
		
		public function MyTheory():void {
			simpleMath = new SimpleMath();
		} 
	}
}