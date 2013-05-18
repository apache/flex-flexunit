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
	
	import org.flexunit.runner.IRequest;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.Request;
	import org.flexunit.runner.manipulation.ISort;
	
	public class RequestMock implements IRequest
	{
		public var mock:Mock;
		
		public function get sort():ISort
		{
			return mock.sort;
		}
		
		public function set sort(value:ISort):void
		{
			mock.sort = value;
		}
		
		public function get iRunner():IRunner
		{
			return mock.iRunner;
		}
		
		public function filterWith(filterOrDescription:*):Request
		{
			return mock.filerWith(filterOrDescription);
		}
		
		public function RequestMock()
		{
			mock = new Mock(this);
		}
	}
}