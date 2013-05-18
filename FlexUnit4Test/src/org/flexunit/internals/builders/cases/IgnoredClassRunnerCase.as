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
package org.flexunit.internals.builders.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.IgnoredClassRunner;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.notification.mocks.RunNotifierMock;
	import org.flexunit.token.mocks.AsyncTestTokenMock;

	public class IgnoredClassRunnerCase
	{
		protected var ignoredClassRunner:IgnoredClassRunner;
		protected var ignoredClass:Class;
		
		[Before(description="Create an instance of the IgnoredClassRunner class")]
		public function createIgnoredClassRunner():void {
			ignoredClass = Object;
			ignoredClassRunner = new IgnoredClassRunner(ignoredClass);
		}
		
		[After(description="Remove the reference to the instance of the IgnoredClassRunner class")]
		public function destroyIgnoredClassRunner():void {
			ignoredClassRunner = null;
			ignoredClass = null;
		}
		
		[Test(description="Ensure that the run function properly operates")]
		public function runTest():void {
			var runNotifierMock:RunNotifierMock = new RunNotifierMock();
			var asyncTestTokenMock:AsyncTestTokenMock = new AsyncTestTokenMock();
			
			//Set expectations
			runNotifierMock.mock.method("fireTestIgnored").withArgs(IDescription).once;
			asyncTestTokenMock.mock.method("sendResult").withArgs(null).once;
			
			ignoredClassRunner.run(runNotifierMock, asyncTestTokenMock);
			
			//Verify that expectations were met
			runNotifierMock.mock.verify();
			asyncTestTokenMock.mock.verify();
		}
		
		[Test(description="Ensure that the description function correctly returns an an object that implements IDescription")]
		public function descriptionTest():void {
			Assert.assertTrue( ignoredClassRunner.description is IDescription );
		}
	}
}