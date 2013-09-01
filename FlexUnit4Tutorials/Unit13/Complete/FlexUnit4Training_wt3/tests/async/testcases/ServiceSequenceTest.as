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
		private static const TIMEOUT:Number = 500;
		
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