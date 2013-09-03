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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;

    /**
     * @private
     */
	public class TestBeforeAfterClassOrderAsync {
		private static const TIMER_LENGTH:int = 10;
		private static const TIME_OUT:int = 50;

		private static var timer:Timer = new Timer( TIMER_LENGTH, 1 );
		protected static var setupOrderArray:Array = new Array();

		[BeforeClass(async)]
		public static function beginNoOrder():void {
			setupOrderArray.push( "beginNoOrder" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[BeforeClass(async,order=1)]
		public static function beginOne():void {
			setupOrderArray.push( "beginOne" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[BeforeClass(async,order=70)]
		public static function beginSeventy():void {
			setupOrderArray.push( "beginSeventy" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[BeforeClass(async,order=2)]
		public static function beginTwo():void {
			setupOrderArray.push( "beginTwo" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[AfterClass(async)]
		public static function afterNoOrder():void {
			setupOrderArray.push( "afterNoOrder" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[AfterClass(async,order=1)]
		public static function afterOne():void {
			setupOrderArray.push( "afterOne" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[AfterClass(async,order=2)]
		public static function afterTwo():void {
			setupOrderArray.push( "afterTwo" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[AfterClass(async,order=8)]
		public static function afterEight():void {
			setupOrderArray.push( "afterEight" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		[AfterClass(async,order=30)]
		public static function afterThirty():void {
			setupOrderArray.push( "afterThirty" );
			timer.reset();
			Async.proceedOnEvent( TestBeforeAfterClassOrderAsync, timer, TimerEvent.TIMER_COMPLETE, TIME_OUT );
			timer.start();
		}

		//This depends on the test order also working, so we should always run this test after the method order has been verified
		[Test(order=1)]
	    public function checkingBeforeOrder() : void {
	    	//3 begins
	    	if ( setupOrderArray.length == 4 ) {
	    		Assert.assertEquals( setupOrderArray[ 0 ], "beginNoOrder" );
	    		Assert.assertEquals( setupOrderArray[ 1 ], "beginOne" );
	    		Assert.assertEquals( setupOrderArray[ 2 ], "beginTwo" );
	    		Assert.assertEquals( setupOrderArray[ 3 ], "beginSeventy" );
	    	} else {
	    		Assert.fail("Incorrect number of begin calls");
	    	}
	    }

		[Test(order=2)]
	    public function checkingAfterOrder() : void {
	    	//3 begins
	    	//0 afters at this point
	    	//unlike the other tests for before and after, with BeforeClass and AfterClass, we need to ensure they did *not* run again before this method
	    	checkingBeforeOrder();
	    }
	}
}