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