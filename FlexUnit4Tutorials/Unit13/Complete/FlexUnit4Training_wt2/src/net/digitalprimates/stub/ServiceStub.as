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
package net.digitalprimates.stub
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.digitalprimates.event.StubServiceEvent;

	public class ServiceStub extends EventDispatcher
	{
		private var timer:Timer;
		private var _connected:Boolean = false;
		
		private static const DELAY:Number = 250;
		
		public function ServiceStub()
		{
		}
		
		public function get connected():Boolean
		{
			return _connected;
		}
	
		public function sendRefreshRequest():void {
			requestConnection();
		}

		protected function requestConnection():void {
			if( !connected && !timer ) {
				timer = new Timer( DELAY, 1 );
				timer.addEventListener( TimerEvent.TIMER_COMPLETE, handleConnection, false, 0, true );
				timer.start();
			}
		}
		
		protected function requestShutdown():void {
			if( connected && !timer ) {
				_connected = false;
				dispatchEvent( new StubServiceEvent( StubServiceEvent.SHUTDOWN_RECEIVED ) );
			}
			else if( connected && timer && timer.running ) {
				dispatchEvent( new StubServiceEvent( StubServiceEvent.SHUTDOWN_REFUSED ) );
			}	
			else {
				throw new Error( "Server not connected!" );
			}
		}
		
		protected function handleConnection( event:TimerEvent ):void {
			_connected = true; 
			
			if( timer && timer.running ) {
				timer.stop();
			}
			timer.removeEventListener( TimerEvent.TIMER_COMPLETE, handleConnection );
			timer = new Timer( DELAY, 1 );
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, handleRefreshRequest, false, 0, true );
			timer.start();
					
			dispatchEvent( new StubServiceEvent( StubServiceEvent.CONNECTION_CREATED ) );
		}
		
		protected function handleRefreshRequest( event:TimerEvent ):void {
			if( timer && timer.running ) {
				timer.stop();
			}
			timer.removeEventListener( TimerEvent.TIMER_COMPLETE, handleRefreshRequest );
			timer = null;
			
			dispatchEvent( new StubServiceEvent( StubServiceEvent.RECEIVED_REQUEST ) );
			requestShutdown();
		}
	}
}