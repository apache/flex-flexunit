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
package org.flexunit {
	import org.flexunit.async.AsyncSuite;
	import org.flexunit.cases.AssertCase;
	import org.flexunit.cases.AssertThatCase;
	import org.flexunit.cases.AssertionErrorCase;
	import org.flexunit.cases.AssumeCase;
	import org.flexunit.cases.AssumeThatCase;

	import org.flexunit.events.EventsSuite;
	import org.flexunit.experimental.ExperimentSuite;
	import org.flexunit.internals.InternalsSuite;
	import org.flexunit.reporting.ReportingSuite;
	import org.flexunit.runner.RunnerSuite;
	import org.flexunit.runners.RunnersSuite;
	import org.flexunit.token.TokenSuite;
	import org.flexunit.utils.UtilsSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class FlexUnit4FlexUnitSuite
	{
		//Suites
		public var asyncSuite:AsyncSuite;
		public var eventsSuite:EventsSuite;
		public var experimentalSuite:ExperimentSuite;
		public var internalSuite:InternalsSuite;
		public var reportingSuite:ReportingSuite;
		public var runnerSuite:RunnerSuite;
		public var runnersSuite:RunnersSuite;
		public var tokenSuite:TokenSuite;
		public var utilsSuite:UtilsSuite;
		
		//Cases
		public var assertCase:AssertCase;
		public var assertionErrorCase:AssertionErrorCase;
		public var assertThatCase:AssertThatCase;
		public var assumeCase:AssumeCase;
		public var assumeThatCase:AssumeThatCase;
	}
}