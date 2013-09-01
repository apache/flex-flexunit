package async.testcases
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;

	public class BasicTimerTest
	{
		private var timer:Timer;
	
		[Before]
		public function setUp():void {
			timer = new Timer( 100, 1 );
		}
		
		[After]
		public function tearDown():void	{
			if( timer && timer.running ) 
			{
				timer.stop();
			}
			
			timer = null;
		}
		[Test( async )]
		public function shouldCompleteTimer():void 
		{
			timer.addEventListener( TimerEvent.TIMER_COMPLETE,
				Async.asyncHandler( this, handleWin, 100, timer, handleTimeout ),
				false, 0, true );
			
			timer.start();
		}
		protected function handleWin( event:Event, passThroughData:Object ):void {
			Assert.assertEquals( ( event.target as Timer ).currentCount, passThroughData.repeatCount );
		}
		
		protected function handleTimeout( passThroughData:Object ):void {
			Assert.fail("Pending event timed out");
		}

	}
}