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
package org.flexunit.runner.notification.async.cases
{
	import flash.events.Event;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.runner.notification.async.WaitingListener;
	import org.flexunit.runner.notification.async.AsyncListenerWatcher;

	public class WaitingListenerCase
	{
		protected static var LISTENER_TIME:int = 6000;
		
		protected var waitingListener:WaitingListener;
		
		[Before(description="Create an instance of the WaitingListener class")]
		public function setUp():void {
			waitingListener = new WaitingListener();
		}
		
		[After(description="Remove the reference ot the WaitingListener class")]
		public function tearDown():void {
			waitingListener = null;
		}
		
		[Test(description="Ensure the test isn't ready before five seconds have passed")]
		public function readyFailsTest():void {
			Assert.assertFalse( waitingListener.ready );
		}
		
		[Test(async,
			description="Ensure that the test is ready after five seconds have passed")]
		public function readyTest():void {
			waitingListener.addEventListener( AsyncListenerWatcher.LISTENER_READY, Async.asyncHandler( this, handleListenerReady, LISTENER_TIME, null, handleListenerTimeout ), false, 0, true );
		}
		
		public function handleListenerReady( event:Event, passThroughData:Object ):void {
			Assert.assertTrue( waitingListener.ready );
		}
		
		public function handleListenerTimeout( passThroughData:Object ):void {
			Assert.fail('Timeout.');
		}
	}
}