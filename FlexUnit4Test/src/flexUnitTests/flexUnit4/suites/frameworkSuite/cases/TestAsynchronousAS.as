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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases {
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.helper.MySpecialResponder;
	
	import mx.core.mx_internal;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	
    /**
     * @private
     */
	public class TestAsynchronousAS {
		protected var timer:Timer;
		protected static var SHORT_TIME:int = 100;
		protected static var LONG_TIME:int = 250;

		[Before]
		public function setUp():void {
			timer = new Timer( LONG_TIME, 1 );
		}
		
		[After]
		public function tearDown():void {
			if ( timer ) {
				timer.stop();
			}
			
			timer = null;
		}

		[Test(async)]
	    public function testInTimePass() : void {
	    	//We fire in SHORT_TIME mills, but are willing to wait LONG_TIME
	    	timer.delay = SHORT_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this, handleAsyncShouldPass, LONG_TIME, null, handleAsyncShouldNotFail ), false, 0, true ); 
	    	timer.start();
	    }

		[Test(async,expects="flexunit.framework.AssertionFailedError")]
	    public function testInTimeFail() : void {
	    	//We fire in SHORT_TIME mills, but are willing to wait LONG_TIME
	    	timer.delay = SHORT_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this,  handleAsyncShouldPassCallFail, LONG_TIME, null, handleAsyncShouldNotFail ), false, 0, true ); 
	    	timer.start();
	    }

		[Test(async,expects="TypeError")]
	    public function testInTimeError() : void {
	    	//We fire in SHORT_TIME mills, but are willing to wait LONG_TIME
	    	timer.delay = SHORT_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this,  handleAsyncShouldPassCauseError, LONG_TIME, null, handleAsyncShouldNotFail ), false, 0, true ); 
	    	timer.start();
	    }
	    
		[Test(async)]
	    public function testTooLatePass() : void {
	    	//We fire in LONG_TIME mills, but are willing to wait SHORT_TIME
	    	timer.delay = LONG_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this,  handleAsyncShouldNotPass, SHORT_TIME, null, handleAsyncShouldFail ), false, 0, true ); 
	    	timer.start();
	    }

		[Test(async,expects="flexunit.framework.AssertionFailedError")]
	    public function testTooLateFail() : void {
	    	//We fire in LONG_TIME mills, but are willing to wait SHORT_TIME
	    	timer.delay = LONG_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this,  handleAsyncShouldPass, SHORT_TIME, null, handleAsyncShouldFailCallFail ), false, 0, true ); 
	    	timer.start();
	    }

		[Test(async,expects="TypeError")]
	    public function testTooLateError() : void {
	    	//We fire in LONG_TIME mills, but are willing to wait SHORT_TIME
	    	timer.delay = LONG_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this,  handleAsyncShouldNotPass, SHORT_TIME, null, handleAsyncShouldFailCauseError ), false, 0, true ); 
	    	timer.start();
	    }
	    
		[Test(async)]
	    public function testNotReallyAsynchronousPass() : void {
	    	//This tests one of the edges that flex unit did not handle well. What if we receive our async event *before*
	    	//this method finishes executing
	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  handleAsyncShouldPassImmediate, SHORT_TIME, null, handleAsyncShouldNotFail ), false, 0, true );
	    	eventDispatcher.dispatchEvent( new Event('immediate') ); 
	    }

		[Test(async,expects="flexunit.framework.AssertionFailedError")]
	    public function testNotReallyAsynchronousFail() : void {
	    	//This tests one of the edges that flex unit did not handle well. What if we receive our async event *before*
	    	//this method finishes executing
	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  handleAsyncShouldPassImmediateCallFail, SHORT_TIME, null, handleAsyncShouldNotFail ), false, 0, true );
	    	eventDispatcher.dispatchEvent( new Event('immediate') ); 
	    }

//Come back to me if ( !asyncHandlingStatement.bodyExecuting ) {

/*  	    public function testNotReallyAsynchronousFailAfterAsync() : void {
	    	//This tests one of the edges that flex unit did not handle well. What if we receive our async event *before*
	    	//this method finishes executing, but then something else in the method execution causes a failure
	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  handleAsyncShouldPassImmediate, SHORT_TIME, null, handleAsyncShouldNotFail ), false, 0, true );
	    	eventDispatcher.dispatchEvent( new Event('immediate') ); 
	    	
	    	//A failure now should still know to mark this method as failed, despite the async completing, verify this
	        try 
	        {
	            Assert.fail();
	        } 
	        catch ( e : AssertionFailedError ) 
	        {
		    	if ( registeredMethod != testNotReallyAsynchronousFailAfterAsync ) {
			    	fail( 'Proceeded to next test method after async before completing method body' );
		    	}
	            return;
	        }
	        throw new AssertionFailedError("Async Fail Uncaught");
	    } */
 
 	    public function testMethodBodyExecuting() : void {
	    	//This is a simple flag which makes a lot of difference. If the methodBodyExecuting flag is set to true, we are still in
	    	//the method body of the test execution and should not consider a test complete. It is important for cases where
	    	//the async may fire before the method body execution if complete
	    	
 			var asyncHandlingStatement:IAsyncHandlingStatement = AsyncLocator.getCallableForTest( this );

	    	if ( !asyncHandlingStatement.bodyExecuting ) {
		    	Assert.fail( 'Method body is executing, but methodBodyExecuting is false' );
	    	}
	    }

		[Test(async)]
	    public function testMethodBodyExecutingPending() : void {
	    	//Ensure the method body executing flag is true if the async event happens before the method body execution is complete
	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  checkMethodBodyExecutingFlagTrue, SHORT_TIME, null, handleAsyncShouldNotFail ), false, 0, true );
	    	eventDispatcher.dispatchEvent( new Event('immediate') ); 
	    }

		[Test(async)]
	    public function testMethodBodyExecutingComplete() : void {
	    	//Ensure the method body executing flag is false if the async event happens after the method body execution is complete
	    	timer.delay = SHORT_TIME;
	    	timer.addEventListener(TimerEvent.TIMER_COMPLETE, Async.asyncHandler( this,  checkMethodBodyExecutingFlagFalse, LONG_TIME, null, handleAsyncShouldNotFail ), false, 0, true ); 
	    	timer.start();
	    }

		[Test(async)]
	    public function testPassThroughDataOnSuccess() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.randomValue = 5;
	    	passThroughData.timer = timer;

	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  checkPassThroughDataOnSuccess, SHORT_TIME, passThroughData, handleAsyncShouldNotFail ), false, 0, true );
	    	eventDispatcher.dispatchEvent( new Event('immediate') ); 
	    }

		[Test(async)]
	    public function testPassThroughDataOnFailure() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.randomValue = 5;
	    	passThroughData.timer = timer;

	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  handleAsyncShouldNotPass, SHORT_TIME, passThroughData, checkPassThroughDataOnTimeout ), false, 0, true );

			//Never dispatch the event. Allow the timeout to occur
			//eventDispatcher.dispatchEvent( new Event('immediate') ); 
	    }

		[Test(async)]
	    public function testEventDataCorrect() : void {
	    	var eventDispatcher:EventDispatcher = new EventDispatcher();
	    	eventDispatcher.addEventListener('immediate', Async.asyncHandler( this,  checkEventData, SHORT_TIME, null, handleAsyncShouldNotFail ), false, 0, true );
	    	eventDispatcher.dispatchEvent( new DataEvent('immediate', false, false, '0123456789' ) ); 
	    }

		//why is this ignored?
		[Ignore]
		[Test(async)]
	    public function testMultipleAsyncAllSucceed() : void {
	    	//Run both of these two previous async tests at the same time. FlexUnit had major issues with 'reentrance' and single AsyncHelpers
			testInTimePass();
			testNotReallyAsynchronousPass();
	    }

		//why is this ignored?
		[Ignore]
		[Test(async)]
	    public function testMultipleAsyncSuccessAndTimeout() : void {
	    	testTooLateFail();
			testNotReallyAsynchronousPass();
	    }

		[Test(async)]
	    public function testMultipleAsyncFirstReturnsBeforeSecondSuccess() : void {
			testNotReallyAsynchronousPass();
			testInTimePass();
	    }

		[Test(async,expects="flexunit.framework.AssertionFailedError")]
	    public function testMultipleAsyncFirstReturnsBeforeSecondTimeout() : void {
			testNotReallyAsynchronousPass();
			testTooLateFail();
	    }
		
		/** Helper methods for the tests above beyond this point
		 * 
		 * 
		 * 
		 * **/
		protected function checkEventData( event:DataEvent, passThroughData:Object ):void {
			Assert.assertEquals( event.data, '0123456789' );  
		}

		protected function checkPassThroughDataOnSuccess( event:Event, passThroughData:Object ):void {
			Assert.assertEquals( passThroughData.randomValue, 5 );
			Assert.assertStrictlyEquals( passThroughData.timer, timer );
		}

		protected function checkPassThroughDataOnTimeout( passThroughData:Object ):void {
			Assert.assertEquals( passThroughData.randomValue, 5 );
			Assert.assertStrictlyEquals( passThroughData.timer, timer );
		}

 		protected function checkMethodBodyExecutingFlagTrue( event:Event, passThroughData:Object ):void {
			var asyncHandlingStatement:IAsyncHandlingStatement = AsyncLocator.getCallableForTest( this );
			
			if ( !asyncHandlingStatement ) {
				Assert.fail( 'Cannot locate current async handler for this test' );
			}

 	    	if ( !asyncHandlingStatement.bodyExecuting ) {
		    	Assert.fail( 'Method body is executing, but methodBodyExecuting is false' );
	    	}
		}

		protected function checkMethodBodyExecutingFlagFalse( event:Event, passThroughData:Object ):void {
			var asyncHandlingStatement:IAsyncHandlingStatement = AsyncLocator.getCallableForTest( this );
			
			if ( !asyncHandlingStatement ) {
				Assert.fail( 'Cannot locate current async handler for this test' );
			}

 	    	if ( asyncHandlingStatement.bodyExecuting ) {
		    	Assert.fail( 'Method body is not executing, but methodBodyExecuting is true' );
	    	}
		} 

	    protected function handleAsyncShouldPassImmediate( event:Event, passThroughData:Object ):void {
	    }

	    protected function handleAsyncShouldPassImmediateCallFail( event:Event, passThroughData:Object ):void {
            Assert.fail();
	    }

	    protected function handleAsyncShouldPass( event:Event, passThroughData:Object ):void {
	    }

	    protected function handleAsyncShouldNotPass( event:Event, passThroughData:Object ):void {
	    	Assert.fail('Timer event received after Timeout Occured');
	    }

	    protected function handleAsyncShouldPassCallFail( event:Event, passThroughData:Object ):void {
            Assert.fail();
	    }

	    protected function handleAsyncShouldPassCauseError( event:Event, passThroughData:Object ):void {
        	//do not instantiate
        	var blah:Date;
        	//Cause an error
        	blah.date = blah.day + 5;
	    }

		//----------------------------------

	    protected function handleAsyncShouldFail( passThroughData:Object ):void {
	    }

	    protected function handleAsyncShouldNotFail( passThroughData:Object ):void {
	    	Assert.fail('Timeout Reached Incorrectly');
	    }

	    protected function handleAsyncShouldFailCallFail( passThroughData:Object ):void {
            Assert.fail();
	    }

	    protected function handleAsyncShouldFailCauseError( passThroughData:Object ):void {
        	//do not instantiate
        	var blah:Date;
        	//Cause an error
        	blah.date = blah.day + 5;
	    }
	}

}