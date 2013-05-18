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
package flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite
{
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedBasicFunctionality;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedExternalLoader;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedFuncVsArrayDataProvider;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedWithAsync;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedWithBeforeAfter;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedBasicFunctionality;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedExternalLoader;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedFuncVsArrayDataProvider;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedWithAsync;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedWithBeforeAfter;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ParamSuite
	{
		public var test1:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedBasicFunctionality;
		public var test2:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedExternalLoader;
		public var test3:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedFuncVsArrayDataProvider;
		public var test4:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedWithAsync;
		public var test5:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestJUnitParameterizedWithBeforeAfter;
		public var test6:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedBasicFunctionality;
		public var test7:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedExternalLoader;
		public var test8:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedFuncVsArrayDataProvider;
		public var test9:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedWithAsync;
		public var test10:flexUnitTests.flexUnit4.suites.frameworkSuite.parameterizedSuite.TestNGParameterizedWithBeforeAfter;
		
	}
}