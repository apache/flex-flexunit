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
package async.testcases
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;

	public class BasicTimerTest
	{
		private var timer:Timer;
	
		[Before]
		public function setUp():void {
			timer = new Timer( 100, 1 );
		}
		
		[After]
		public function tearDown():void	{
			if( timer && timer.running ) 
			{
				timer.stop();
			}
			
			timer = null;
		}
		[Test( async )]
		public function shouldCompleteTimer():void 
		{
			timer.addEventListener( TimerEvent.TIMER_COMPLETE,
				Async.asyncHandler( this, handleWin, 100, timer, handleTimeout ),
				false, 0, true );
			
			timer.start();
		}
		protected function handleWin( event:Event, passThroughData:Object ):void {
			Assert.assertEquals( ( event.target as Timer ).currentCount, passThroughData.repeatCount );
		}
		
		protected function handleTimeout( passThroughData:Object ):void {
			Assert.fail("Pending event timed out");
		}

	}
}