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
package flexUnitTests.flexUnit4.suites.frameworkSuite.rulesSuite
{
	import flexUnitTests.flexUnit4.suites.frameworkSuite.rulesSuite.helper.rules.ordered.RuleFifty;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.rulesSuite.helper.rules.ordered.RuleNoOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.rulesSuite.helper.rules.ordered.RuleOne;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.rulesSuite.helper.rules.ordered.RuleTwo;
	
	import flexunit.framework.Assert;

	public class TestRuleOrder
	{
		public var rulesCalledArray : Array = new Array();
		
		[Rule(order="1")]
		public var ruleOne : RuleOne = new RuleOne();
		
		[Rule(order="2")]
		public var ruleTwo : RuleTwo = new RuleTwo();
		
		[Rule(order="50")]
		public var ruleFifty : RuleFifty = new RuleFifty();
		
		[Rule]
		public var ruleNoOrder : RuleNoOrder = new RuleNoOrder();
		
		[Test]
		public function rule_OrderRight() : void
		{
			Assert.assertEquals( rulesCalledArray[ 0 ], ruleNoOrder.toString() );
			Assert.assertEquals( rulesCalledArray[ 1 ], ruleOne.toString() );
			Assert.assertEquals( rulesCalledArray[ 2 ], ruleTwo.toString() );
			Assert.assertEquals( rulesCalledArray[ 3 ], ruleFifty.toString() );
		}
	}
}