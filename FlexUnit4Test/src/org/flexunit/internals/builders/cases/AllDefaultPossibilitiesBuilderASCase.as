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
package org.flexunit.internals.builders.cases
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder;
	import org.flexunit.internals.builders.FlexUnit1Builder;
	import org.flexunit.internals.builders.FlexUnit4Builder;
	import org.flexunit.internals.builders.IgnoredClassRunner;
	import org.flexunit.internals.builders.MetaDataBuilder;
	import org.flexunit.internals.builders.NullBuilder;
	import org.flexunit.internals.builders.SuiteMethodBuilder;
	import org.flexunit.internals.builders.definitions.FlexUnit1Class;
	import org.flexunit.internals.builders.definitions.FlexUnit4Class;
	import org.flexunit.internals.builders.definitions.Fluint1Class;
	import org.flexunit.internals.builders.definitions.Fluint1Suite;
	import org.flexunit.internals.builders.definitions.IgnoredClass;
	import org.flexunit.internals.runners.FlexUnit1ClassRunner;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.BlockFlexUnit4ClassRunner;
	
	public class AllDefaultPossibilitiesBuilderASCase extends AllDefaultPossibilitiesBuilder
	{
		private var flexunit1Class:FlexUnit1Class;
		private var flexunit4Class:FlexUnit4Class;
		private var ignoredClass:IgnoredClass;
		
		[Test(description="Ensure if a FlexUnit1 style class is passed to runnerForClass a FlexUnit1ClassRunner is returned")]
		public function testIgnoreRunnerForClass() : void {
			var runner:IRunner;
			runner = runnerForClass( FlexUnit1Class );
			Assert.assertTrue( runner is FlexUnit1ClassRunner );
		}
		
		[Test(description="Ensure if a FlexUnit1 style class is passed to runnerForClass a BlockFlexUnit4ClassRunner is returned")]
		public function testFlexUnit4RunnerForClass() : void {
			var runner:IRunner;
			runner = runnerForClass( FlexUnit4Class );
			Assert.assertTrue( runner is BlockFlexUnit4ClassRunner );
		}
		
		[Test(description="Ensure if a class with [Ignore] metadata is passed to runnerForClass an IgnoredClassRunner is returned")]
		public function testIgnoredRunnerForClass() : void {
			var runner:IRunner;
			runner = runnerForClass( IgnoredClass );
			Assert.assertTrue( runner is IgnoredClassRunner );
		}
		
		[Test(description="Ensure that a runner always pulls a new instance")]
		public function testRunnerForClass() : void {
			Assert.assertNotNull( runnerForClass( new Object() as Class ) );
		}
		
		[Test(description="Ensure metaDataBuilder returns a type of MetaDataBuilder")]
		public function testMetaDataBuilder() : void {
			Assert.assertTrue( metaDataBuilder() is MetaDataBuilder );
		}
		
		[Test(description="Ensure suiteMethodBuilder returns the proper type")]
		public function testSuiteMethodBuilder() : void {
			try {
				Assert.assertTrue( suiteMethodBuilder() is SuiteMethodBuilder );
			} catch ( error : AssertionFailedError ) {
				Assert.assertTrue( suiteMethodBuilder() is NullBuilder );
			}
		}
		
		[Test(description="Ensure flexUnit1Builder returns a type of FlexUnit1Builder")]
		public function testFlexUnit1Builder() : void {
			Assert.assertTrue( flexUnit1Builder() is FlexUnit1Builder );
		}

		[Test(description="Ensure flexUnit4Builder returns the proper type")]
		public function testFlexUnit4Builder() : void {
			Assert.assertTrue( flexUnit4Builder() is FlexUnit4Builder );
		}

		public function AllDefaultPossibilitiesBuilderASCase() {
			super( false );
		}
		
	}
}