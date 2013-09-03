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
package tests.org.flexunit.async {
	import flash.net.Responder;
	
	import mockolate.runner.MockolateRule;
	
	import mx.rpc.IResponder;
	
	import org.flexunit.async.AsyncNativeTestResponder;

	public class AsyncNativeTestResponderCase {
		import org.flexunit.asserts.assertEquals;
		import org.flexunit.asserts.assertNull;
		import org.flexunit.asserts.assertStrictlyEquals;
		import org.flexunit.events.AsyncResponseEvent;

		[Test(description="Ensure the result function is passed")]
		public function shouldEmmitResult():void {
			var data:Object = new Object();
			var originalResponder:Object = new Object();
			
			var resultFunction:Function = function ( data:Object ):void {};
			
			var responder:AsyncNativeTestResponder = new AsyncNativeTestResponder( resultFunction, null );
			responder.addEventListener( AsyncResponseEvent.RESPONDER_FIRED, 
				function ( event:AsyncResponseEvent ):void {
					
					assertEquals( "result", event.status );
					assertNull( event.originalResponder );
					assertStrictlyEquals( data, event.data );
					assertStrictlyEquals( resultFunction, event.methodHandler );
				}
			);
			
			responder.result( data );
		}

		[Test(description="Ensure the fault function is passed")]
		public function shouldEmmitFault():void {
			var data:Object = new Object();
			var originalResponder:Object = new Object();
			
			var faultFunction:Function = function ( info:Object ):void {};
			
			var responder:AsyncNativeTestResponder = new AsyncNativeTestResponder( null, faultFunction );
			responder.addEventListener( AsyncResponseEvent.RESPONDER_FIRED, 
				function ( event:AsyncResponseEvent ):void {
					
					assertEquals( "fault", event.status );
					assertNull( event.originalResponder );
					assertStrictlyEquals( data, event.data );
					assertStrictlyEquals( faultFunction, event.methodHandler );
				}
			);
			
			responder.fault( data );
		}
	}
}