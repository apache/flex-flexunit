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
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	
	import tests.org.flexunit.token.helper.PendingStub;

	public class AsyncTestTokenCase {
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var pendingMock:PendingStub;
		
		[Test]
		public function shouldStoreParentToken():void {
			var token:AsyncTestToken = new AsyncTestToken();
			var parentToken:AsyncTestToken = new AsyncTestToken();
			
			token.parentToken = parentToken;
			
			assertStrictlyEquals( parentToken, token.parentToken );
		}
		
		[Test]
		public function shouldAllowDynamicProperties():void {
			var token:AsyncTestToken = new AsyncTestToken();
			
			token.num = 123;
			token.string = "456";
			
			assertEquals( 123, token.num );
			assertEquals( "456", token.string );
		}
		
		[Test]
		public function shouldNotCrashWithNoMethodEntry():void {
			var token:AsyncTestToken = new AsyncTestToken();
			token.sendResult();
		}

		[Test]
		public function shouldNotCrashWithNullMethodEntry():void {
			var token:AsyncTestToken = new AsyncTestToken();

			token.addNotificationMethod( null );
			token.sendResult();
		}

		[Test]
		public function shouldReturnReferenceToToken():void {
			var token:AsyncTestToken = new AsyncTestToken();
			assertStrictlyEquals( token, token.addNotificationMethod( null ) );
		}
		
		[Test]
		public function shouldNotifySingleMethodEntry():void {
			var token:AsyncTestToken = new AsyncTestToken();
			stub( pendingMock ).method("handleChildResult").args( ChildResult ).once();
			
			token.addNotificationMethod( pendingMock.handleChildResult );
			token.sendResult();
		}
		
		[Test]
		public function shouldNotifyMethodOnlyOnce():void {
			var token:AsyncTestToken = new AsyncTestToken();
			stub( pendingMock ).method("handleChildResult").args( ChildResult ).once();
			
			token.addNotificationMethod( pendingMock.handleChildResult );
			token.addNotificationMethod( pendingMock.handleChildResult );
			token.addNotificationMethod( pendingMock.handleChildResult );

			token.sendResult();
		}
		
		[Test]
		public function shouldConvertToStringWithDebugName():void {
			var token:AsyncTestToken = new AsyncTestToken( "MyDebugClass" );
			assertEquals( "MyDebugClass: 0 listeners", token.toString() );
		}

		[Test]
		public function shouldConvertToStringWithoutDebugName():void {
			var token:AsyncTestToken = new AsyncTestToken();
			assertEquals( "0 listeners", token.toString() );
		}

		[Test]
		public function shouldConvertToStringWithDebugNameAndListener():void {
			var token:AsyncTestToken = new AsyncTestToken( "MyDebugClass" );
			token.addNotificationMethod( pendingMock.handleChildResult );

			assertEquals( "MyDebugClass: 1 listeners", token.toString() );
		}
		
	}
}