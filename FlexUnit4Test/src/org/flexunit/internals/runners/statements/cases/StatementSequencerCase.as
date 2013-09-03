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
package org.flexunit.internals.runners.statements.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.runners.statements.StatementSequencer;
	import org.flexunit.internals.runners.statements.mock.AsyncStatementMock;

	public class StatementSequencerCase
	{
		//TODO: The constructor needs two tests to check both a null queue and a queue being passed into the the constructor.  What
		//is the best way to validate that this occurred correctly?
		[Test(description="This needs a description")]
		public function statmentSequencerNoQueueTest():void {

		}
		
		[Test(description="This needs a description")]
		public function statmentSequencerQueueTest():void {

		}
		
		//TODO: Determine how to test evaluate.  The queue can be checked by determing whehter values were correctly added via toString, or
		//it could also be checked through execute.  What is the best way to test this?
		[Test(description="This needs a description")]
		public function addStepTest():void {
			
		}
		
		//TODO: Determine how to test evaluate.  It calls directly into handleChildExecuteComplete, after setting the parent token.
		//It appears that the parent token only is involved when the queue is empty.  When the queue has a value, only an IAsyncStatment
		//will be called
		[Test(description="This needs a description")]
		public function evaluateTest():void {
			
		}
		
		[Test(description="Ensure that the handleChildExecuteComplete function correctly operates with no error in the ChildResult")]
		public function handleChildExecuteCompleteNoErrorTest():void {
			
		}
		
		[Test(description="Ensure that the handleChildExecuteComplete function correctly operates with an error in the ChildResult")]
		public function handleChildExecuteCompleteErrorTest():void {
			
		}
		
		[Test(description="Ensure that the handleChildExecuteComplete function correctly operates with an empty queue")]
		public function handleChildExecuteCompleteEmptyQueueTest():void {
			
		}
		
		[Test(description="Ensure that the handleChildExecuteComplete function correctly operates with a non-empty queue")]
		public function handleChildExecuteCompleteNonEmptyQueueTest():void {
			
		}
		
		[Test(description="Ensure that the toString function returns the correct string for an empty queue")]
		public function toStringEmptyQueueTest():void {
			var statementSequencer:StatementSequencer = new StatementSequencer();
			
			Assert.assertEquals( "StatementSequencer :\n", statementSequencer.toString() );
		}
		
		//TODO: Mocks already have a toString method, how should this test be written?
		[Test(description="Ensure that the toString function returns the correct string for a non-empty queue")]
		public function toStringNonEmptyQueueTest():void {
			var valueA:String = "value A";
			var asyncStatementMock:AsyncStatementMock = new AsyncStatementMock();
			var queue:Array = [asyncStatementMock];	
			var statementSequencer:StatementSequencer = new StatementSequencer(queue);
			
			asyncStatementMock.mock.method("twoString").withNoArgs.once.returns(valueA);
			
			Assert.assertEquals( "StatementSequencer :\n" + 
				"   " + "0" + " : " + valueA + "\n" , statementSequencer.toString() );
			
			asyncStatementMock.mock.verify();
		}
	}
}