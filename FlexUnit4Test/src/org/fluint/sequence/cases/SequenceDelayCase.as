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
package org.fluint.sequence.cases
{
	import org.flexunit.Assert;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.mock.AsyncHandlingStatementMock;
	import org.fluint.sequence.SequenceDelay;
	import org.fluint.sequence.mocks.SequenceRunnerMock;

	public class SequenceDelayCase
	{
		//TODO: Is it possible to test this case?  The timer is private and that is the target.
		[Test(description="Ensure that the setupListeners function properly operates ")]
		public function setupListenersTest():void {
			var testCase:Object = new Object();
			var sequence:SequenceRunnerMock = new SequenceRunnerMock();	
			var timeout:int = 1000;
			var sequenceDelay:SequenceDelay = new SequenceDelay(timeout);
			
			//Create an AsyncHandlingStatementMock and register it to to the AsyncLocator
			var asyncHandlingStatementMock:AsyncHandlingStatementMock = new AsyncHandlingStatementMock();
			AsyncLocator.registerStatementForTest(asyncHandlingStatementMock, testCase);
			
			//Set expectations
			asyncHandlingStatementMock.mock.method("asyncHandler").withArgs( asyncHandlingStatementMock.handleNextSequence, timeout + 900000, sequence, null).once.returns(new Function());
			
			sequenceDelay.setupListeners(testCase, sequence);
			
			//Verify expectations were met
			asyncHandlingStatementMock.mock.verify();
			
			//Remove the reference from the AsyncLocator for the testCase
			AsyncLocator.cleanUpCallableForTest(testCase);
		}
		
		[Test(description="Ensure that the forSeconds function creates an instance of the SequenceDelay class with the correct timeout")]
		public function Test():void {
			var sequenceDelay:SequenceDelay = SequenceDelay.forSeconds(10);
			
			Assert.assertNotNull( sequenceDelay );
			Assert.assertEquals( 910000, sequenceDelay.timeout );
		}
	}
}