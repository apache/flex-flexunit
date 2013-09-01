package net.digitalprimates.event
{
	import flash.events.Event;
	
	public class StubServiceEvent extends Event
	{
		public static const CONNECTION_CREATED:String = "connectionCreated";
		public static const RECEIVED_REQUEST:String = "receivedRequest";
		public static const SHUTDOWN_RECEIVED:String = "shutdownAcknowledged";
		public static const SHUTDOWN_REFUSED:String = "shutdownRefused";
		
		public function StubServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}