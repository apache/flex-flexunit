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
package flexUnitTests.hamcrest
{
	import org.hamcrest.BaseMatcherTest;
	import org.hamcrest.CustomMatcherTest;
	import org.hamcrest.CustomTypeSafeMatcherTest;
	import org.hamcrest.collection.EveryTest;
	import org.hamcrest.collection.IsArrayContainingTest;
	import org.hamcrest.collection.IsArrayTest;
	import org.hamcrest.collection.IsArrayWithSizeTest;
	import org.hamcrest.core.AllOfTest;
	import org.hamcrest.core.AnyOfTest;
	import org.hamcrest.core.CombinableTest;
	import org.hamcrest.core.DescribedAsTest;
	import org.hamcrest.core.IsAnythingTest;
	import org.hamcrest.core.IsNotTest;
	import org.hamcrest.core.ThrowsTest;
	import org.hamcrest.number.BetweenTest;
	import org.hamcrest.number.CloseToTest;
	import org.hamcrest.number.GreaterThanTest;
	import org.hamcrest.number.LessThanTest;
	import org.hamcrest.object.HasPropertyTest;
	import org.hamcrest.object.HasPropertyWithValueTest;
	import org.hamcrest.object.IsEqualTest;
	import org.hamcrest.object.IsInstanceOfTest;
	import org.hamcrest.object.IsNullTest;
	import org.hamcrest.object.IsSameTest;
	import org.hamcrest.text.StringContainsTest;
	import org.hamcrest.text.StringEndsWithTest;
	import org.hamcrest.text.StringStartsWithTest;
	import org.hamcrest.MatcherAssertTest;
	import org.hamcrest.TypeSafeMatcherTest;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]

	public class HamcrestSuite
	{
		public var t1:BaseMatcherTest;
		public var t2:CustomMatcherTest;
		public var t3:CustomTypeSafeMatcherTest;
		public var t4:MatcherAssertTest;
		public var t5:TypeSafeMatcherTest;
		
		// core
		public var t6:AllOfTest;
		public var t7:AnyOfTest;
		public var t8:CombinableTest;
		public var t9:DescribedAsTest;
		public var t10:EveryTest;
		public var t11:IsAnythingTest;
		public var t12:IsNotTest;
		
		// collection
		public var t13:IsArrayTest;
		public var t14:IsArrayWithSizeTest;
		public var t15:IsArrayContainingTest;
		
		// number
		public var t16:BetweenTest;
		public var t17:CloseToTest;
		public var t18:GreaterThanTest;
		public var t19:LessThanTest;
		
		// object
		public var t20:HasPropertyTest;
		public var t21:HasPropertyWithValueTest;
		public var t22:IsEqualTest;
		public var t23:IsInstanceOfTest;
		public var t24:IsNullTest;
		public var t25:IsSameTest;
		
		// text
		public var t26:StringContainsTest;
		public var t27:StringEndsWithTest;
		public var t28:StringStartsWithTest;
		
		// extras
		public var t29:ThrowsTest;

	}
}