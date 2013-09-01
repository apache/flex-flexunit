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
	
	import net.digitalprimates.event.StubServiceEvent;
	import net.digitalprimates.stub.ServiceStub;
	
	import org.flexunit.assertThat;
	import org.fluint.sequence.SequenceCaller;
	import org.fluint.sequence.SequenceRunner;
	import org.fluint.sequence.SequenceWaiter;

	public class ServiceSequenceTest
	{
		public static const TIMEOUT:Number = 500;
		
		private var service:ServiceStub;
		
		[Before]
		public function setup():void {
			service = new ServiceStub();
		}
		
		[After]
		public function teardown():void {
			service = null;
		}
		[Test( async )]
		public function shouldCompleteRequest():void {
			var sequence:SequenceRunner = new SequenceRunner( this );
			
			sequence.addStep( new SequenceCaller( service, service.sendRefreshRequest ) );
			sequence.addStep( new SequenceWaiter( service, StubServiceEvent.CONNECTION_CREATED, TIMEOUT ) );
			sequence.addStep( new SequenceWaiter( service, StubServiceEvent.RECEIVED_REQUEST, TIMEOUT ) );
			sequence.addStep( new SequenceWaiter( service, StubServiceEvent.SHUTDOWN_RECEIVED, TIMEOUT ) );
			
			sequence.addAssertHandler( handleCompleteRequest, null );
			
			sequence.run();
		}
		
		protected function handleCompleteRequest( event:Event, passThroughData:Object ):void {
			assertThat( !service.connected );
		}


	}
}