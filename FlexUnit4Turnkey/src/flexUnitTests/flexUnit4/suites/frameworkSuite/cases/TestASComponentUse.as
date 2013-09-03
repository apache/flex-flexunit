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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import flash.events.Event;
	
	import mx.controls.TextInput;
	import mx.events.FlexEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
    /**
     * @private
     */
	public class TestASComponentUse {
		protected var textInput:TextInput;
		
		[Before(async,ui)]
		public function setUp():void {
			//Create a textInput, add it to the testEnvironment. Wait until it is created, then run tests on it
			textInput = new TextInput();
			Async.proceedOnEvent( this, textInput, FlexEvent.CREATION_COMPLETE, 100 );
			//textInput.addEventListener( FlexEvent.CREATION_COMPLETE, Async.asyncHandler( this, handleSetupComplete, 100 ), false, 0, true );
			UIImpersonator.addChild( textInput );
		}
		
		[After(async,ui)]
		public function tearDown():void {
			UIImpersonator.removeChild( textInput );			
			textInput = null;

		}

		[Test(async,ui)]
	    public function testSetTextProperty() : void {

	    	var passThroughData:Object = new Object();
	    	passThroughData.propertyName = 'text';
	    	passThroughData.propertyValue = 'digitalprimates';
	    	
	    	textInput.addEventListener( FlexEvent.VALUE_COMMIT, Async.asyncHandler( this, handleVerifyProperty, 100, passThroughData, handleEventNeverOccurred ), false, 0, true );
	    	setProperty( textInput, passThroughData );
	    }

		[Test(async,ui)]
	    public function testSetHTMLTextProperty() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.propertyName = 'htmlText';
	    	passThroughData.propertyValue = 'digitalprimates';
	    	
	    	textInput.addEventListener( "htmlTextChanged", Async.asyncHandler( this, handleVerifyProperty, 100, passThroughData, handleEventNeverOccurred ), false, 0, true );
	    	setProperty( textInput, passThroughData );
	    }

		[Test(async,ui)]
	    public function testSetEnabledTwiceProperty() : void {
	    	//A nice clear box test. The enabled property only emmits an event if it acutally changes. So, if enabled is set to true
	    	//I should not get an event
	    	var passThroughData:Object = new Object();
	    	passThroughData.propertyName = 'enabled';
	    	passThroughData.propertyValue = true;
	    	
	    	textInput.addEventListener( "enabledChanged", Async.asyncHandler( this, handleUnexpectedEvent, 100, passThroughData, handleExpectedTimeout ), false, 0, true );
	    	setProperty( textInput, passThroughData );
	    }

	    protected function setProperty( target:Object, passThroughData:Object ):void {
	    	target[ passThroughData.propertyName ] = passThroughData.propertyValue;
	    }
	    
	    protected function handleSetupComplete( event:FlexEvent, passThroughData:Object ):void {
	    	//This method will be called after the TextInput is created. The TextInput will be ready to use
	    	//before any of our test methods run
	    }

	    protected function handleVerifyProperty( event:Event, passThroughData:Object ):void {
	    	//This method will be called after the TextInput is created. The TextInput will be ready to use
	    	//before any of our test methods run
	    	Assert.assertEquals( event.target[ passThroughData.propertyName ], passThroughData.propertyValue );
	    }
	    
	    protected function handleEventNeverOccurred( passThroughData:Object ):void {
	    	Assert.fail('Pending Event Never Occurred');
	    }
	    
	    protected function handleUnexpectedEvent( event:Event, passThroughData:Object ):void {
	    	Assert.fail('Unexpected Event Received');
	    }
	    
	    protected function handleExpectedTimeout( passThroughData:Object ):void {
	    }
	}
}