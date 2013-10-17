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
package org.flexunit.internals.builders
{
	import org.flexunit.internals.builders.cases.AllDefaultPossibilitiesBuilderASCase;
	import org.flexunit.internals.builders.cases.FlexUnit1BuilderCase;
	import org.flexunit.internals.builders.cases.FlexUnit4BuilderCase;
	import org.flexunit.internals.builders.cases.IgnoredBuilderCase;
	import org.flexunit.internals.builders.cases.IgnoredClassRunnerCase;
	import org.flexunit.internals.builders.cases.MetaDataBuilderCase;
	import org.flexunit.internals.builders.cases.NullBuilderCase;
	import org.flexunit.internals.builders.cases.SuiteMethodBuilderCase;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class InternalBuildersSuite
	{
		public var ignoreClassRunnerCase:IgnoredClassRunnerCase;
		public var allDefaultPossibilitiesCase:AllDefaultPossibilitiesBuilderASCase;
		public var flexUnit1BuilderCase:FlexUnit1BuilderCase;
		public var flexUnit4BuilderCase:FlexUnit4BuilderCase;
	
		public var ignoredBuilderCase:IgnoredBuilderCase;
		public var ignoredClassRunnerCase :IgnoredClassRunnerCase;
		public var suiteMethodBuilderCase:SuiteMethodBuilderCase;
		
		public var metaDataBuilderCase : MetaDataBuilderCase;
		
		//empty test case
		//public var nullBuilderCase : NullBuilderCase;
	}
}