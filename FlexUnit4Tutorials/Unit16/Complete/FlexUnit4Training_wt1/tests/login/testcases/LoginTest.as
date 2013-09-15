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
package login.testcases
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import helper.UserAndPasswordDataHelper;
	
	import mx.events.FlexEvent;
	
	import net.digitalprimates.components.login.LoginComponent;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.fail;
	import org.flexunit.async.Async;
	import org.fluint.sequence.SequenceEventDispatcher;
	import org.fluint.sequence.SequenceRunner;
	import org.fluint.sequence.SequenceSetter;
	import org.fluint.sequence.SequenceWaiter;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class LoginTest
	{
		private static const LONG_TIME:int = 500;
		
		private var loginComponent:LoginComponent;
		
		public static var userAndPasswordDataLoader:UserAndPasswordDataHelper = 
			new UserAndPasswordDataHelper("xml/usersAndPasswords.xml" );
		
		[DataPoints(loader="userAndPasswordDataLoader")]
		public static var userData:Array;
		
		[Before( async, ui )]
		public function setup():void {
			loginComponent = new LoginComponent();
			Async.proceedOnEvent( this, loginComponent, FlexEvent.CREATION_COMPLETE );
			UIImpersonator.addChild( loginComponent );
		}
		
		[After( async, ui )]
		public function teardown():void {
			UIImpersonator.removeChild( loginComponent );
			loginComponent = null;
		}
		
		[Test( ui )]
		public function shouldReturnEmptyFieldsOnStartup():void {
			assertEquals( "", loginComponent.usernameTI.text );
			assertEquals( "", loginComponent.passwordTI.text );
		}
		
		[Test( dataProvider="userData", ui, async )]
		public function shouldLoginWithProvidedCredentials( username:String, password:String ):void {
			var sequence:SequenceRunner = new SequenceRunner( this );
			var passThroughData:Object = new Object();
			passThroughData.username = username;
			passThroughData.password = password;
			
			sequence.addStep( new SequenceSetter( loginComponent.usernameTI, {text:username} ) );
			sequence.addStep( new SequenceWaiter( loginComponent.usernameTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );
			
			sequence.addStep( new SequenceSetter( loginComponent.passwordTI, {text:password} ) );
			sequence.addStep( new SequenceWaiter( loginComponent.passwordTI, FlexEvent.VALUE_COMMIT, LONG_TIME ) );

			
			sequence.addStep( new SequenceEventDispatcher( loginComponent.loginBtn, new MouseEvent( MouseEvent.CLICK, true, false ) ) );
			sequence.addStep( new SequenceWaiter( loginComponent, 'loginRequested', LONG_TIME, handleSuccessTimeout ) );
		
			sequence.addAssertHandler( handleLoginRequested, passThroughData );	
			
			sequence.run();

		}
		
		protected function handleLoginRequested( event:Event, passThroughData:Object ):void {
			assertThat( passThroughData.username, equalTo( loginComponent.usernameTI.text ) );
			assertThat( passThroughData.password, equalTo( loginComponent.passwordTI.text ) );
		}
		
		protected function handleSuccessTimeout( passThroughData:Object ):void {
			fail( "Login request was not received as expected" );
		}
	}
}