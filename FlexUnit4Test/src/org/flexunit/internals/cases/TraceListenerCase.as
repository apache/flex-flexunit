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
package org.flexunit.internals.cases
{
	import org.flexunit.AssertionError;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.mocks.DescriptionMock;
	import org.flexunit.runner.mocks.ResultMock;
	import org.flexunit.runner.notification.mocks.FailureMock;

	public class TraceListenerCase
	{
		//TODO: There doesn't appear to be a way to test this class since it only does traces. Can this be altered?
		
		protected var traceListener:TraceListener;
		
		[Before(description="Create an instance of the TraceListener class")]
		public function createTraceListener():void {
			traceListener = new TraceListener();
		}
		
		[After(description="Remove the reference to the instance of the TraceListener class")]
		public function destroyTraceListener():void {
			traceListener = null;
		}
		
		[Test]
		public function testRunFinishedTest():void {
			var resultMock:ResultMock = new ResultMock();
			
			resultMock.mock.property("runTime").returns(123);
			resultMock.mock.property("failures").returns([]);
			resultMock.mock.property("successful").returns(true);
			resultMock.mock.property("runCount").returns(1);
			
			traceListener.testRunFinished(resultMock);
		}

		[Test]
		public function testStartedTest():void {
			var descriptionMock:DescriptionMock = new DescriptionMock();
			
			descriptionMock.mock.property("displayName").returns("testName");
			
			traceListener.testStarted(descriptionMock);
		}

		[Test]
		public function testFailureNotErrorTest():void {
			var failureMock:FailureMock = new FailureMock();
			var descriptionMock:DescriptionMock = new DescriptionMock();
			
			failureMock.mock.property("exception").returns(new AssertionError());
			failureMock.mock.property("description").returns(descriptionMock);
			descriptionMock.mock.property("displayName").returns("testName");
			
			traceListener.testFailure(failureMock);
		}

		[Test]
		public function testFailureErrorTest():void {
			var failureMock:FailureMock = new FailureMock();
			var descriptionMock:DescriptionMock = new DescriptionMock();
			
			failureMock.mock.property("exception").returns(new Error());
			failureMock.mock.property("description").returns(descriptionMock);
			descriptionMock.mock.property("displayName").returns("testName");
			
			traceListener.testFailure(failureMock);
		}

		[Test]
		public function testIgnoredTest():void {
			var descriptionMock:DescriptionMock = new DescriptionMock();
			
			descriptionMock.mock.property("displayName").returns("testName");
			
			traceListener.testIgnored(descriptionMock);
		}
	}
}