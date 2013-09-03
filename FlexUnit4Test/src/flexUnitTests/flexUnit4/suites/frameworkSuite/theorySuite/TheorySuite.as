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
package flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite
{
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.AsyncTheorySuite;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.ExternalTheorySuite;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.FunctionalTheorySuite;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.TestTheoriesSuite;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.TestTheoriesWithBeforeAfter;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TheorySuite
	{
		public var test1:flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.AsyncTheorySuite;
		public var test2:flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.ExternalTheorySuite;
		public var test3:flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.FunctionalTheorySuite;
		public var test4:flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.TestTheoriesSuite;
		public var test5:flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.TestTheoriesWithBeforeAfter;
		
	}
}