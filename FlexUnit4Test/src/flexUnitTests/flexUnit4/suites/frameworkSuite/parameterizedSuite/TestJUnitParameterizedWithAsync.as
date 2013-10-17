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
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	import org.flexunit.runners.Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestJUnitParameterizedWithAsync
	{
		public static var testRunCount : int = 0;
		public static var asyncHandlerCount : int = 0;
		
		public var num : int;
		
		protected var timer : Timer;
		
		private var foo : Parameterized;
		
		[Parameters]
		public static var testDataOneIntParam:Array = [ [ 0 ], [ 1 ], [ 2 ] ];
		
		[Test(async)]
		public function parameterized_junit_verifyAsync() : void
		{
			++testRunCount;
			timer = new Timer( ( num * 100 ) + 500, 1 );
			var asyncHandler:Function = Async.asyncHandler( this, handleTimerComplete, 2000, null );
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, asyncHandler, false, 0, true );
			timer.start();
			Assert.assertEquals( testRunCount, asyncHandlerCount + 1 );
		}
		
		protected function handleTimerComplete( event : TimerEvent, passThroughData : Object ) : void
		{
			Assert.assertEquals( num, testRunCount - 1 );
			++asyncHandlerCount;
		}
		
		public function TestJUnitParameterizedWithAsync( num : int )
		{
			this.num = num;
		}
	}
}