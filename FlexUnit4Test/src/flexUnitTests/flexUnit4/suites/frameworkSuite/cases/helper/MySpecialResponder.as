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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases.helper {
	import flash.events.EventDispatcher;
	
	import org.flexunit.async.IAsyncTestResponder;
	import org.flexunit.events.AsyncResponseEvent;

	/**Sample responder to prove case where responder implenting IAsyncTestResponder are passed directly to the framework's async methods **/
	[Event(name="responderFired",type="net.digitalprimates.fluint.events.AsyncResponseEvent")]
	
	public class MySpecialResponder extends EventDispatcher implements IAsyncTestResponder {
		/**
		 *  @private
		 */
		private var _resultHandler:Function;
		
		/**
		 *  @private
		 */
		private var _faultHandler:Function;

		public function fault( info:Object ):void {
			_faultHandler( info );
			dispatchEvent( new AsyncResponseEvent( AsyncResponseEvent.RESPONDER_FIRED, false, false, this, 'fault', info ) );
		}
		
		public function result( data:Object ):void {
			_resultHandler( data );
			dispatchEvent( new AsyncResponseEvent( AsyncResponseEvent.RESPONDER_FIRED, false, false, this, 'result', data ) );
		}
		
		public function MySpecialResponder(result:Function, fault:Function) {
			super();
			_resultHandler = result;
			_faultHandler = fault;
		}
	}
}