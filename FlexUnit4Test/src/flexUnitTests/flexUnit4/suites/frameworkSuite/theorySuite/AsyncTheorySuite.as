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
package flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.assertThat;
	import org.flexunit.assumeThat;
	import org.flexunit.async.Async;
	import org.flexunit.experimental.theories.Theories;
	import org.hamcrest.number.lessThan;
	import org.hamcrest.object.IsEqualMatcher;
	import org.hamcrest.object.instanceOf;
	
	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class AsyncTheorySuite {
		private var theory:Theories;
		private var timer:Timer;
 
   		[DataPoints]
  		[ArrayElementType("int")]
		public static var intValues:Array = [1,2,3,4,5,6,7,8,9];

		[DataPoints]
		[ArrayElementType("String")]
		public static var stringValues:Array = ["one","two","three","four","five"];

  		[Theory(async)]
		public function testIntOnly( value:int ):void {
			timer = new Timer( 1000, 1 );
			timer.start();
			
			Async.handleEvent( this, timer, TimerEvent.TIMER_COMPLETE, handleTimerComplete, 2000, value );
			
			// test which involves int value	
			//trace( "      int case " + value );
		}	
		
		private function handleTimerComplete( event:TimerEvent, passThroughData:Object ):void {
			var value:int = passThroughData as int;
			assumeThat( value, lessThan( 10 ) );
			assertThat( value, instanceOf(int) );

		}

		[Theory]
		public function testStringIntCombo( intVal:int, stringValue:String ):void {
			assertThat( intVal, instanceOf(int) );
			assertThat( stringValue, instanceOf(String) );
		} 	

		public function AsyncTheorySuite():void {
			//assumeThat( intValue, lessThan( 2 ) );
			//assumptions in constructor do not yet work... don't know if they ever could, what exactly would you do if you couldn't construct?
			//trace("Constructor with " + intValue );
		}
		
	}
}