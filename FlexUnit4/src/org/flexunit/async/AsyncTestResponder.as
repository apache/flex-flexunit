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
package org.flexunit.async {
	import flash.events.EventDispatcher;
	
	import org.flexunit.events.AsyncResponseEvent;
	
	/** 
	 * The 'responderFired' event is fired when either a result or
	 * fault is dispatched.
	 */
	[Event(name="responderFired",type="net.digitalprimates.fluint.events.AsyncResponseEvent")]
	
	/**
	 * A respoder for asynchronous tests that contains result and fault handlers for the test succeeding or the test 
	 * failing to succeed.
	 */
	public class AsyncTestResponder extends EventDispatcher implements IAsyncTestResponder {
		/**
		 * @private
		 */
		private var originalResponder:*;		
		
		/**
		 * Dispatches an AsyncResponseEvent with the orignalResponder, a "fault" status, and the provided info object.
		 * 
		 * @inheritDoc
		 *
		 */
		public function fault( info:Object ):void {
			dispatchEvent( new AsyncResponseEvent( AsyncResponseEvent.RESPONDER_FIRED, false, false, originalResponder, 'fault', info ) );
		}
		
		/**
		 * Dispatches an AsyncResponseEvent with the orignalResponder, a "result" status, and the provided info object.
		 * 
		 * @inheritDoc
		 */
		public function result( data:Object ):void {
			dispatchEvent( new AsyncResponseEvent( AsyncResponseEvent.RESPONDER_FIRED, false, false, originalResponder, 'result', data ) );
		}
		
		/**
		 * Constructor.
		 * 
		 * @param originalResponder The responder to be passed when the AsyncResponseEvent is dispatched.
		 */
		public function AsyncTestResponder( originalResponder:* ) {
			this.originalResponder = originalResponder;
		}
	}
}