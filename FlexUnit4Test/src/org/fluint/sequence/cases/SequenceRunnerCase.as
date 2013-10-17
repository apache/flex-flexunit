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
	import org.fluint.sequence.SequenceRunner;
	
	import org.flexunit.Assert;
	import org.fluint.sequence.mocks.SequenceStepMock;

	public class SequenceRunnerCase
	{
		//TODO: Additional tests need to be written for this class
		
		protected var sequenceRunner:SequenceRunner;
		protected var testCase:Object;
		
		[Before(description="Create an instance of the SequenceRunner class")]
		public function createSequenceRunner():void {
			testCase = new Object();
			sequenceRunner = new SequenceRunner(testCase);
		}
		
		[After(description="Remove the reference to the instance of the SequenceRunner class")]
		public function destroySequenceRunner():void {
			sequenceRunner = null;
			testCase = null;
		}
		
		[Test(description="Ensure that the numberOfSteps property is correctly obtained")]
		public function getNumberOfStepsTest():void {
			var sequenceStepMockOne:SequenceStepMock = new SequenceStepMock();
			var sequenceStepMockTwo:SequenceStepMock = new SequenceStepMock();
			
			sequenceRunner.addStep(sequenceStepMockOne);
			sequenceRunner.addStep(sequenceStepMockTwo);
			
			Assert.assertEquals( 2, sequenceRunner.numberOfSteps );
		}
		
		[Test(description="Ensure that the getStep function retruns the correct step for the provided index parameter")]
		public function getStepTest():void {
			var sequenceStepMockOne:SequenceStepMock = new SequenceStepMock();
			var sequenceStepMockTwo:SequenceStepMock = new SequenceStepMock();
			
			sequenceRunner.addStep(sequenceStepMockOne);
			sequenceRunner.addStep(sequenceStepMockTwo);
			
			Assert.assertEquals( sequenceStepMockTwo, sequenceRunner.getStep(1) );
		}
		
		[Test(description="")]
		public function test():void {
			
		}
	}
}