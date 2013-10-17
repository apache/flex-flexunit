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
package org.flexunit
{
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAsynchronousFlex;
	
	import org.flexunit.async.cases.AsyncFlexCase;
	import org.flexunit.async.cases.AsyncTestResponderCase;
	import org.flexunit.async.cases.TestResponderCase;
	import org.flexunit.events.cases.AsyncResponseEventCase;
	import org.flexunit.internals.builders.cases.AllDefaultPossibilitiesBuilderFlexCase;
	import org.flexunit.internals.cases.TextListenerCase;
	import org.flexunit.reporting.cases.FailureFormatterFlexCase;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class FlexUnit4FlexSuite
	{
		
		public var allDefaultPossibilitesFlexCase : AllDefaultPossibilitiesBuilderFlexCase;
		public var asyncFlexCase:AsyncFlexCase;
		
		public var asyncTestResponderCase:AsyncTestResponderCase;
		public var testResponderCase:TestResponderCase;
		public var asyncResponseEventCase:AsyncResponseEventCase;
		public var textListenerCase:TextListenerCase;
		
		public var testAsynchornousFlex:TestAsynchronousFlex;
		
		public var ffFlexCase : FailureFormatterFlexCase;
	}
}