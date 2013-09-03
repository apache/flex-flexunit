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
package org.flexunit.runner.notification.mocks
{
	import com.anywebcam.mock.Mock;
	
	import org.flexunit.Assert;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IRunListener;
	import org.flexunit.runner.notification.IRunNotifier;
	
	public class RunNotifierMock implements IRunNotifier
	{
		public var mock:Mock;
		
		public function fireTestRunStarted(description:IDescription):void
		{
			mock.fireTestRunStarted(description);
		}
		
		public function fireTestRunFinished(result:Result):void
		{
			mock.fireTestRunFinished(result);
		}
		
		public function fireTestStarted(description:IDescription):void
		{
			mock.fireTestStarted(description);
		}
		
		public function fireTestFailure(failure:Failure):void
		{
			mock.fireTestFailure(failure);
		}
		
		public function fireTestAssumptionFailed(failure:Failure):void
		{
			mock.fireTestAssumptionFailed(failure);
		}
		
		public function fireTestIgnored(description:IDescription):void
		{
			mock.fireTestIgnored(description);
		}
		
		public function fireTestFinished(description:IDescription):void
		{
			mock.fireTestFinished(description);
		}
		
		public function addListener(listener:IRunListener):void
		{
			mock.addListener(listener);
		}
		
		public function addFirstListener(listener:IRunListener):void
		{
			mock.addFirstListener(listener);
		}
		
		public function removeListener(listener:IRunListener):void
		{
			mock.removeListener(listener);
		}

		public function removeAllListeners():void {
			mock.removeAllListeners();
		}

		public function pleaseStop():void
		{
			mock.pleaseStop();
		}

		public function RunNotifierMock()
		{
			mock = new Mock( this, true );
		}
	}
}