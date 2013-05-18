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
package org.flexunit.internals
{
	import org.flexunit.internals.builders.InternalBuildersSuite;
	import org.flexunit.internals.cases.TraceListenerCase;
	import org.flexunit.internals.events.cases.ExecutionCompleteEventCase;
	import org.flexunit.internals.requests.InternalRequestsSuite;
	import org.flexunit.internals.runners.InternalRunnersSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class InternalsSuite
	{
		public var internalBuildersSuite:InternalBuildersSuite;
		public var internalRequestSuite:InternalRequestsSuite;
		public var internalRunnersSuite:InternalRunnersSuite;
		
		public var executionCompletionEvent:ExecutionCompleteEventCase;
		public var traceListenerCase:TraceListenerCase;
		
		//Not yet implemented
	}
}