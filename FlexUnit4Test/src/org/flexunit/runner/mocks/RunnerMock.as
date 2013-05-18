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
package org.flexunit.runner.mocks
{
	import com.anywebcam.mock.Mock;
	
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.notification.IRunNotifier;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.IAsyncTestToken;
	
	public class RunnerMock implements IRunner
	{
		public var mock:Mock;
		
		public function run(notifier:IRunNotifier, previousToken:IAsyncTestToken):void
		{
			mock.run(notifier, previousToken);
		}
	
		public function pleaseStop():void {
			mock.pleaseStop();
		}

		public function get description():IDescription
		{
			return mock.description;
		}
		
		public function RunnerMock()
		{
			mock = new Mock(this);
		}
	}
}