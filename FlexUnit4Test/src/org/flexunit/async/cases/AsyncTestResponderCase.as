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
package org.flexunit.async.cases
{
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncTestResponder;
	import org.flexunit.events.AsyncResponseEvent;

	public class AsyncTestResponderCase
	{
		//TODO: Make sure these tests correctly test the class
		protected static var TIMEOUT:int = 250;
		
		protected var asyncTestResponder:AsyncTestResponder;
		protected var originalResponder:Object;
		protected var data:Object;
		
		[Before(description="Create an instance of the AsyncTestResponder")]
		public function createAsyncTestResponder():void {
			originalResponder = new Object();
			asyncTestResponder = new AsyncTestResponder(originalResponder);
			data = new Object();
		}
		
		[After(description="Destroy the instance of the AsyncTestResponder")]
		public function destroyAsyncTestResponder():void {
			originalResponder = null;
			asyncTestResponder = null;
			data = null;
		}
		
		[Test(async, description="Ensure an AsyncResponseEvent is dispatched with the correct result information")]
		public function resultTest():void {
			asyncTestResponder.addEventListener(
				AsyncResponseEvent.RESPONDER_FIRED, Async.asyncHandler(this, handleResult, TIMEOUT, null, timeoutReached), false, 0 , true);
		
			asyncTestResponder.result(data);
		}
		
		[Test(async, description="Ensure an AsyncResponseEvent is dispatched with the correct fault information")]
		public function faultTest():void {
			asyncTestResponder.addEventListener(
				AsyncResponseEvent.RESPONDER_FIRED, Async.asyncHandler(this, handleFault, TIMEOUT, null, timeoutReached), false, 0 , true);
			
			asyncTestResponder.fault(data);
		}
		
		protected function handleResult(event:AsyncResponseEvent, passThroughData:Object):void {
			Assert.assertEquals(event.originalResponder, originalResponder);
			Assert.assertEquals(event.status, "result");
			Assert.assertEquals(event.data, data);
		}
		
		protected function handleFault(event:AsyncResponseEvent, passThroughData:Object):void {
			Assert.assertEquals(event.originalResponder, originalResponder);
			Assert.assertEquals(event.status, "fault");
			Assert.assertEquals(event.data, data);
		}
		
		protected function timeoutReached(passThroughData:Object):void {
			Assert.fail('AsyncTestResponderCase Test Timeout Occured');
		}
	}
}