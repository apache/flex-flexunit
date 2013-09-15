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
	import mx.events.FlexEvent;
	
	import net.digitalprimates.components.login.LoginComponent;
	
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;

	public class LoginStartupTest
	{
		private static const LONG_TIME:int = 500;
		
		private var loginComponent:LoginComponent;
		
		[Before(async, ui)]
		public function setup():void
		{
			loginComponent = new LoginComponent();
			Async.proceedOnEvent( this, loginComponent, FlexEvent.CREATION_COMPLETE );
			
			UIImpersonator.addChild( loginComponent );

		}
				
		[After(async, ui)]
		public function teardown():void
		{
			UIImpersonator.removeChild( loginComponent );
			loginComponent = null;

		}
		[Test(ui)]
		public function shouldReturnEmptyFieldsOnStartup():void {
			assertThat( loginComponent.usernameTI.text == '' );
			assertThat( loginComponent.passwordTI.text == '' );

		} 

	}
}