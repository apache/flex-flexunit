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
package org.flexunit.events.rule {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	[Event(name="timeOutExpired")]
	public class TimeoutMonitor extends EventDispatcher {
		private var timer:Timer;
		private var timeOut:Number = 0;
		private var startTime:Number = 0;
		private var _expired:Boolean = false;
		
		public static const TIME_OUT_EXPIRED:String = "timeOutExpired";

		public function get pending():Boolean {
			return timer.running;
		}

		public function get expired():Boolean {
			var currentTime:Number = getTimer();

			if ( !timer.running ) {
				return false;
			}

			if ( ( currentTime - startTime ) > timeOut ) {
				return true;
			}
			
			return _expired;
		}

		public function set expired(value:Boolean):void {
			_expired = value;
			
			if ( value ) {
				dispatchEvent( new Event( TIME_OUT_EXPIRED ) );
			}
		}

		private function handleTimeOut( event:TimerEvent ):void {
			expired = true;
		}

		public function start():void {
			startTime = getTimer();
			timer.start();
		}
		
		public function finished():void {
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handleTimeOut );
		}

		public function TimeoutMonitor( timeOut:Number ) {
			this.timeOut = timeOut;
			timer = new Timer( timeOut, 1 );
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, handleTimeOut );
		}
	}
}