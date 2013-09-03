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
	import flash.events.MouseEvent;
	
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.mxml.SimpleMXMLLoginComponent;
	
	import mx.events.FlexEvent;
	import mx.events.ValidationResultEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.sequence.SequenceCaller;
	import org.fluint.sequence.SequenceEventDispatcher;
	import org.fluint.sequence.SequenceRunner;
	import org.fluint.sequence.SequenceSetter;
	import org.fluint.sequence.SequenceWaiter;
	import org.fluint.uiImpersonation.UIImpersonator;

    /**
     * @private
     */
	public class TestMXMLComponentUse {
		protected static var LONG_TIME:int = 500;

		protected var loginForm:SimpleMXMLLoginComponent;

		[Before(async,ui)]
		public function setUp():void {
			loginForm = new SimpleMXMLLoginComponent();
			Async.proceedOnEvent( this, loginForm, FlexEvent.CREATION_COMPLETE, LONG_TIME );
			UIImpersonator.addChild( loginForm );
		}
		
		[After(async,ui)]
		public function tearDown():void {
			UIImpersonator.removeChild( loginForm );			
			loginForm = null;
		}

		[Test(async,ui)]
	    public function testLoginEventStandard() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.username = 'myuser1';
	    	passThroughData.password = 'somepsswd';
	    	
	    	Async.handleEvent( this, loginForm, "loginRequested", handleLoginEvent, LONG_TIME, passThroughData ); 
	    	loginForm.usernameTI.text = passThroughData.username;
	    	loginForm.passwordTI.text = passThroughData.password;
	    	loginForm.loginBtn.dispatchEvent( new MouseEvent( 'click', true, false ) );
	    }

		[Test(async,ui)]
	    public function testLoginEventSequence() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.username = 'myuser1';
	    	passThroughData.password = 'somepsswd';

	    	var sequence:SequenceRunner = new SequenceRunner( this );
	    	
	    	with ( sequence ) {
				addStep( new SequenceSetter( loginForm.usernameTI, {text:passThroughData.username} ) );
				addStep( new SequenceWaiter( loginForm.usernameTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
	
				addStep( new SequenceSetter( loginForm.passwordTI, {text:passThroughData.password} ) );
				addStep( new SequenceWaiter( loginForm.passwordTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
	
				addStep( new SequenceEventDispatcher( loginForm.loginBtn, new MouseEvent( MouseEvent.CLICK, true, false ) ) );
				addStep( new SequenceWaiter( loginForm, 'loginRequested', LONG_TIME ) );
				
				addAssertHandler( handleLoginEvent, passThroughData );
				
				run();	    		
	    	}
	    }

		[Test(async,ui)]
	    public function testValidationSequence() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.username = 'myuser1';
	    	passThroughData.password = 'somepsswd';

	    	var sequence:SequenceRunner = new SequenceRunner( this );

			with ( sequence ) {
				addStep( new SequenceSetter( loginForm.usernameTI, {text:passThroughData.username} ) );
				addStep( new SequenceWaiter( loginForm.usernameTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
	
				addStep( new SequenceSetter( loginForm.passwordTI, {text:passThroughData.password} ) );
				addStep( new SequenceWaiter( loginForm.passwordTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
	
				addStep( new SequenceEventDispatcher( loginForm.loginBtn, new MouseEvent( MouseEvent.CLICK, true, false ) ) );
				addStep( new SequenceWaiter( loginForm.sv1, ValidationResultEvent.VALID, LONG_TIME ) );
				
				addAssertHandler( handleValidEvent, passThroughData );
				
				run();
			}
	    }

		[Test(async,ui)]
	    public function testInValidationSequence() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.username = 'myuser1';
	    	passThroughData.password = 'a';

	    	var sequence:SequenceRunner = new SequenceRunner( this );

			with ( sequence ) {
				addStep( new SequenceSetter( loginForm.usernameTI, {text:passThroughData.username} ) );
				addStep( new SequenceWaiter( loginForm.usernameTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
	
				addStep( new SequenceSetter( loginForm.passwordTI, {text:passThroughData.password} ) );
				addStep( new SequenceWaiter( loginForm.passwordTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
	
				addStep( new SequenceEventDispatcher( loginForm.loginBtn, new MouseEvent( MouseEvent.CLICK, true, false ) ) );
				addStep( new SequenceWaiter( loginForm.sv2, ValidationResultEvent.INVALID, LONG_TIME ) );
				
				addAssertHandler( handleValidEvent, passThroughData );
				
				run();
			}
	    }

		[Test(async,ui)]
	    public function testWithValidateNowSequence() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.username = 'myuser1';
	    	passThroughData.password = 'a';

	    	var sequence:SequenceRunner = new SequenceRunner( this );

			with ( sequence ) {
				addStep( new SequenceSetter( loginForm.usernameTI, {text:passThroughData.username} ) );
				addStep( new SequenceCaller( loginForm.usernameTI, loginForm.validateNow ) );

				addStep( new SequenceSetter( loginForm.passwordTI, {text:passThroughData.password} ) );
				addStep( new SequenceCaller( loginForm.passwordTI, loginForm.validateNow ) );

				addStep( new SequenceCaller( loginForm, loginForm.setSomeValue, ['mike'] ) );
				addStep( new SequenceCaller( loginForm, loginForm.setSomeValue, null, getMyArgs ) );

				addStep( new SequenceEventDispatcher( loginForm.loginBtn, new MouseEvent( MouseEvent.CLICK, true, false ) ) );
				addStep( new SequenceWaiter( loginForm.sv2, ValidationResultEvent.INVALID, LONG_TIME ) );

				addAssertHandler( handleValidEvent, passThroughData );
			
				run();
			}
	    }
	    
	    private function getMyArgs():Array {
	    	return ['steve'];
	    }

	    protected function handleLoginEvent( event:Event, passThroughData:Object ):void {
	    	//trace("Login Event Occurred " + event.type );
	    	Assert.assertEquals( passThroughData.username, event.target.username );
	    	Assert.assertEquals( passThroughData.password, event.target.password );
	    }

	    protected function handleValidEvent( event:Event, passThroughData:Object ):void {
	    	//trace("Valid Event Occurred " + event.type );
	    	Assert.assertEquals( passThroughData.username, loginForm.username );
	    	Assert.assertEquals( passThroughData.password, loginForm.password );
	    }
	}
}