package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	
    /**
     * @private
     */
	public class TestAsynchronousSetUpTearDown {
		protected var simpleValueOne:Number;
		protected var simpleValueTwo:Number;
		protected var simpleValueThree:Number;

		protected var timer1:Timer;
		protected var timer2:Timer;

		protected var unitializedBySetup:Object;

		protected static var SHORT_TIME:int = 50;
		protected static var LONG_TIME:int = 1000;

		[Before(async)]
		public function setUp():void {
			timer1 = new Timer( SHORT_TIME, 1 );
			timer1.addEventListener( TimerEvent.TIMER_COMPLETE,Async.asyncHandler( this, handleAsyncSetupCompleteOne, LONG_TIME, {one:1}, handleSetupFailure ) );
			timer1.start();

			//Need to make sure we keep these in order
			timer2 = new Timer( SHORT_TIME + 250, 1 );
			timer2.addEventListener( TimerEvent.TIMER_COMPLETE,Async.asyncHandler( this, handleAsyncSetupCompleteTwo, LONG_TIME, {two:2}, handleSetupFailure ) );
			timer2.start();
			
			simpleValueThree = 3;
		}

		[After(async)]
		public function tearDown():void {
			simpleValueOne = -1;
			simpleValueTwo = -1;
			simpleValueThree = -1;

			unitializedBySetup = new Object();
		}
		
		protected function handleAsyncSetupCompleteOne( event:Event, passThroughData:Object ):void {
			simpleValueOne = 1;
			
			if ( unitializedBySetup ) {
				Assert.fail("variable unitializedBySetup was initialized. Test ran before setup was complete");
			}
		}

		protected function handleAsyncSetupCompleteTwo( event:Event, passThroughData:Object ):void {
			simpleValueTwo = 2;
			
			if ( unitializedBySetup ) {
				Assert.fail("variable unitializedBySetup was initialized. Test ran before setup was complete");
			}
		}
		
		protected function handleSetupFailure( passThroughData:Object ):void {
			Assert.fail("Setup did not finish in requisite amount of time");
		}
		
		/**We are only testing setup and teardown, we don't really care what happens here**/
		[Test]
	    public function testEnsureSetupComplete() : void {
	    	Assert.assertEquals( 1, simpleValueOne );
	    	Assert.assertEquals( 2, simpleValueTwo );
	    	Assert.assertEquals( 3, simpleValueThree );
	    	Assert.assertNull( unitializedBySetup );	    	
	    }
	}
}