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
package org.flexunit.internals.runners.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.runners.ChildRunnerSequencer;
	import org.flexunit.internals.runners.statements.mock.AsyncStatementMock;
	import org.flexunit.runner.notification.IRunNotifier;
	import org.flexunit.runner.notification.mocks.RunNotifierMock;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	import org.flexunit.token.mocks.AsyncTestTokenMock;

	public class ChildRunnerSequencerCase
	{
		//TODO: Ensure that these tests and this test case are being implemented correctly
		
		protected var childRunnerSequencer:ChildRunnerSequencer;
		protected var numberOfTimesCalled:int;
		protected var asyncStatmentMock:AsyncStatementMock;
		protected var children:Array;
		protected var runNotifierMock:RunNotifierMock;
		
		[Before(description="Create an instance of the ChildRunnerSequencer class")]
		public function createChildRunnerSequencer():void {
			numberOfTimesCalled = 0;
			asyncStatmentMock = new AsyncStatementMock();
			children = [asyncStatmentMock];
			runNotifierMock = new RunNotifierMock();
			childRunnerSequencer = new ChildRunnerSequencer(children, runChildFunction, runNotifierMock);;
		}
		
		[After(description="Remvoe the reference to the instance of the ChildRunnerSequencer class")]
		public function destroyChildRunnerSequencer():void {
			childRunnerSequencer = null;
			numberOfTimesCalled = 0;
			asyncStatmentMock = null;
			children = null;
			runNotifierMock = null;
		}
		
		[Test(description="Ensure that the executeStep function correctly calls the runChild function with the proper parameters")]
		public function executeStepTest():void {
			//Call into handleChildExecuteComplete with a non-empty queue in order to call executeStep
			childRunnerSequencer.handleChildExecuteComplete(new ChildResult(new AsyncTestTokenMock));
			
			Assert.assertEquals( 1, numberOfTimesCalled );
		}
		
		[Test(description="Ensure that the toString function returns the correct string value")]
		public function toStringTest():void {
			Assert.assertEquals( "ChildRunnerSequence", childRunnerSequencer.toString() );
		}
		
		protected function runChildFunction(child:*, notifier:IRunNotifier, asyncTestToken:AsyncTestToken):void {
			numberOfTimesCalled++;
		}
	}
}