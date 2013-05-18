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
package org.flexunit.internals.requests.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.requests.SortingRequest;
	import org.flexunit.runner.mocks.RequestMock;
	import org.flexunit.runner.mocks.RunnerMock;

	public class SortingRequestCase
	{
		//TODO: Ensure that this test and this test case are being implemented correctly
		
		protected var sortingRequest:SortingRequest;
		protected var requestMock:RequestMock;
		protected var comparator:Function;
		
		[Before(description="Create an instance of SortingRequest")]
		public function createSortingRequest():void {
			requestMock = new RequestMock();
			comparator = new Function();
			sortingRequest = new SortingRequest(requestMock, comparator);
		}
		
		[After(description="Remove the reference to the instance of the SortingRequest")]
		public function destroySortingRequest():void {
			sortingRequest = null;
			requestMock = null;
			comparator = null
		}
		
		[Test(description="Ensure that the get iRunner function returns an iRunner")]
		public function getIRunnerTest():void {
			var runnerMock:RunnerMock = new RunnerMock();
			requestMock.mock.property("iRunner").returns(runnerMock);
			
			Assert.assertEquals( runnerMock, sortingRequest.iRunner );
		}
	}
}