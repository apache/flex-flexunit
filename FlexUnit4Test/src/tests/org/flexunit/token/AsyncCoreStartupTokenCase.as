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
package tests.org.flexunit.token {
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.runner.IRunner;
	import org.flexunit.token.AsyncCoreStartupToken;
	
	import tests.org.flexunit.token.helper.PendingStub;

	public class AsyncCoreStartupTokenCase {
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var pendingMock:PendingStub;
		
		[Mock]
		public var runner:IRunner;
		
		[Test]
		public function shouldStoreAndRetrieveIRunner():void {
			var token:AsyncCoreStartupToken = new AsyncCoreStartupToken();

			token.runner = runner;

			assertStrictlyEquals( runner, token.runner );
		}
		
		[Test]
		public function shouldNotCrashWithNoMethodEntries():void {
			var token:AsyncCoreStartupToken = new AsyncCoreStartupToken();
			token.sendReady();
		}

		[Test]
		public function shouldReturnReferenceToToken():void {
			var token:AsyncCoreStartupToken = new AsyncCoreStartupToken();
			assertStrictlyEquals( token, token.addNotificationMethod( null ) );
		}

		[Test]
		public function shouldNotifySingleMethodEntry():void {
			var token:AsyncCoreStartupToken = new AsyncCoreStartupToken();
			
			token.runner = runner;

			stub( pendingMock ).method("notifyMe").args( runner ).once();

			token.addNotificationMethod( pendingMock.notifyMe );
			token.sendReady();
		}

		[Test]
		public function shouldNotifyThreeMethodEntries():void {
			var token:AsyncCoreStartupToken = new AsyncCoreStartupToken();
			
			token.runner = runner;
			
			stub( pendingMock ).method("notifyMe").args( runner ).thrice();
			
			token.addNotificationMethod( pendingMock.notifyMe );
			token.addNotificationMethod( pendingMock.notifyMe );
			token.addNotificationMethod( pendingMock.notifyMe );

			token.sendReady();
		}

	}
}