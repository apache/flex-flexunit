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
package suite.cases
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.events.PropertyChangeEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;

	public class NestedAsync
	{
		private static const TIME_OUT:int = 3000;
		private var timer:Timer;

		[Before(async)]
		public function runBeforeEveryTest() : void
		{    
			timer = new Timer( 1000, 5 );
			
			//Wait for the item to be created before continuing tests.
			Async.handleEvent( this, timer, TimerEvent.TIMER, handleTimerTick, TIME_OUT);
			timer.start();
		}
		
		[After]
		public function runAfterEveryTest() : void
		{
			timer.stop();
			timer = null;
		}

		[Test(async)]
		public function itemExists() : void
		{
			Assert.assertTrue( true );
		}
		
		
		private function handleTimerTick(evt:TimerEvent, eventObject:Object) : void
		{			
			if ( timer.currentCount == 5 )
			{
				// Now that the item has been created, we can start the tests.
				return;
			}
			else
			{
				// Keep waiting.
				Async.handleEvent( this, timer, TimerEvent.TIMER, handleTimerTick, TIME_OUT);
			}
		}
	}
}
