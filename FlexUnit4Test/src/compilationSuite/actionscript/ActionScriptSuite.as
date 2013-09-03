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
package compilationSuite.actionscript {
	import compilationSuite.FlexUnit4ASSuite;
	
	import org.flexunit.events.rule.EventRuleSuite;
	
	import tests.flex.lang.reflect.ReflectionSuite;
	import tests.org.flexunit.assert.AssertionAndAssumptionSuite;
	import tests.org.flexunit.async.AsyncSuite;
	import tests.org.flexunit.events.EventsSuite;
	import tests.org.flexunit.runner.util.DescriptionUtilTest;
	import tests.org.flexunit.token.TokenSuite;
	import tests.org.flexunit.utils.UtilsSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ActionScriptSuite {
		public var reflectionSuite:ReflectionSuite;
		public var assertSuite:AssertionAndAssumptionSuite;
		public var eventSuite:EventsSuite;
		public var utilsSuite:UtilsSuite;
		public var tokenSuite:TokenSuite;
		public var async:AsyncSuite;
		public var eventRule:EventRuleSuite;

		public var descriptionUtil:DescriptionUtilTest;
		public var flexUnit4ASSuite:FlexUnit4ASSuite;
	}
}