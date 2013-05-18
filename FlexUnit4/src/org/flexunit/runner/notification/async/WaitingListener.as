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
/**
 * notes
 * 
 * currently, im printing all successes, then all failures, then all ignores.
 * may make more sense to return them in order.  
 * since we need to return the total number of tests in the first result, but we can't know that until
 * all the tests are complete, we probably need to keep an array of all the results in order as they come back, 
 * and when the tests are done, loop over the array and send the messages. 
 * 
 * */
package org.flexunit.runner.notification.async
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IAsyncStartupRunListener;

	/**
	 * This class is simply to test async startup listeners
	 */
	public class WaitingListener extends EventDispatcher implements IAsyncStartupRunListener
	{
		/**
		 * @private
		 */
		private var _ready:Boolean = false;
		
		/**
		 * @private
		 */
		private var msgQueue:Array = new Array();

		/**
		 * Constructor.
		 */
		public function WaitingListener() {
			var timer:Timer = new Timer( 5000, 1 );
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, handleTimerComplete, false, 0, true );
			timer.start();
		}

		/*
		 * Internal methods
		 */

		private function handleTimerComplete(event:Event):void{
			_ready = true;
			dispatchEvent( new Event( AsyncListenerWatcher.LISTENER_READY ) );
			//dispatchEvent( event );
			
		}
		
		/**
		 * Returns a Boolean value indicating whether the listener is ready
		 */
		[Bindable(event="listenerReady")]
		public function get ready():Boolean {
			return _ready;
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function testRunStarted( description:IDescription ):void{
			
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function testRunFinished( result:Result ):void {

		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function testStarted( description:IDescription ):void {
			
		}
		
		/**
		 * 
		 * @private
		 * 
		 */
		public function testFinished( description:IDescription ):void {
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function testAssumptionFailure( failure:Failure ):void {
			
		}

		/**
		 * 
		 * @private
		 * 
		 */
		public function testIgnored( description:IDescription ):void {
		}
	
	
		/**
		 * 
		 * @private
		 * 
		 */
		public function testFailure( failure:Failure ):void {
		}
	}
}