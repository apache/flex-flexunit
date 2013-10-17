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
package tests.org.flexunit.async {
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.AssertionError;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;

	public class AsyncLocatorCase {
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var handlingStatement:IAsyncHandlingStatement;
		
		[Test(description="Ensure an IAsyncHandlingStatement is successfully registered to a TestCase")]
		public function shouldRegisterAndFindHandler():void {
			var testCase:Object = new Object();
			
			AsyncLocator.registerStatementForTest( handlingStatement, testCase );
			assertStrictlyEquals( handlingStatement, AsyncLocator.getCallableForTest( testCase ) );
		}
		
		[Test(expected="org.flexunit.AssertionError",
			description="Ensure an AssertionError is thrown when no IAsyncHandlingStatement is returned for a given TestCase")]
		public function shouldFailWhenAskedForNonExistantTest():void {
			AsyncLocator.getCallableForTest( new Object() );
		}
		
		[Test(expected="org.flexunit.AssertionError",description="Ensure an IAsyncHandlingStatement is successfully removed for a given TestCase")]
		public function shouldThrowErrorRetrievingStatement():void {
			var testCase:Object = new Object();
			
			AsyncLocator.registerStatementForTest( handlingStatement, testCase );
			AsyncLocator.cleanUpCallableForTest( testCase );

			//should error out
			AsyncLocator.getCallableForTest( testCase );
		}
		
		[Test]
		public function shouldNotFindCallableForTest():void {
			var testCase:Object = new Object();
			
			AsyncLocator.registerStatementForTest( handlingStatement, testCase );
			AsyncLocator.cleanUpCallableForTest( testCase );
			
			assertFalse( AsyncLocator.hasCallableForTest( testCase ) );
		}
		
		[Test]
		public function shouldFindCallableForTest():void {
			var testCase:Object = new Object();
			
			assertFalse( AsyncLocator.hasCallableForTest( testCase ) );

			AsyncLocator.registerStatementForTest( handlingStatement, testCase );
			assertTrue( AsyncLocator.hasCallableForTest( testCase ) );
		}

		[Test]
		public function shouldPersistLocatorUntilDependenciesResolved():void {
			var testCase:Object = new Object();
			
			AsyncLocator.registerStatementForTest( handlingStatement, testCase );
			AsyncLocator.registerStatementForTest( handlingStatement, testCase );

			assertTrue( AsyncLocator.hasCallableForTest( testCase ) );
			AsyncLocator.cleanUpCallableForTest( testCase );
			assertTrue( AsyncLocator.hasCallableForTest( testCase ) );
			AsyncLocator.cleanUpCallableForTest( testCase );
			assertFalse( AsyncLocator.hasCallableForTest( testCase ) );
		}

	}
}