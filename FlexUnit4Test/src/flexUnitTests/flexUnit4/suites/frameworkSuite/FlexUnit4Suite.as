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
package flexUnitTests.flexUnit4.suites.frameworkSuite
{
	import flexUnitTests.flexUnit1.framework.AllFrameworkTests;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAssert;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAsynchronousAS;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAsynchronousSetUpTearDown;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterClassOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterClassOrderAsync;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterInheritance;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterOrderAsync;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestDoubleMetaData;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestIgnore;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestMethodOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestSynchronousSetUpTearDown;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.FunctionalTheorySuite;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.TestTheoriesSuite;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
    /**
     * @private
     */
	public class FlexUnit4Suite {
		public var testAssert:TestAssert;
		
		public var testIgnore:TestIgnore;
		public var testDouble:TestDoubleMetaData;

		public var testMethodOrder:TestMethodOrder;
		public var testBeforeAfterOrder:TestBeforeAfterOrder;
		public var testBeforeAfterClassOrder:TestBeforeAfterClassOrder;
		public var testBeforeAfterOrderAsync:TestBeforeAfterOrderAsync;
		public var testBeforeAfterClassOrderAsync:TestBeforeAfterClassOrderAsync;
		public var testBEforeAfterInheritance:TestBeforeAfterInheritance;
		public var testAsynchronous:TestAsynchronousAS;
		public var testSynchronousSetUpTearDown:TestSynchronousSetUpTearDown;
		public var testAsynchronousSetUpTearDown:TestAsynchronousSetUpTearDown;
		public var theory:FunctionalTheorySuite;
		public var testTheoriesCase:TestTheoriesSuite;
		
		//public var hamcrest:HamcrestSuite;
		public var flexUnit1Tests:AllFrameworkTests;
	}
}