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
	import org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder;
	import org.flexunit.internals.builders.FlexUnit1Builder;
	import org.flexunit.internals.builders.Fluint1Builder;
	import org.flexunit.internals.builders.definitions.Fluint1Class;
	import org.flexunit.internals.builders.definitions.Fluint1Suite;
	import org.flexunit.internals.runners.Fluint1ClassRunner;
	
	public class AllDefaultPossibilitiesBuilderFluintCase extends AllDefaultPossibilitiesBuilder
	{
		
		private var fluint1Class:Fluint1Class;
		private var fluint1Suite:Fluint1Suite;

		public function AllDefaultPossibilitiesBuilderFluintCase() {
			super( false );
		}
		
		[Test(description="Ensure flexUnit1Builder returns a type of FlexUnit1Builder")]
		public function testFlexUnit1Builder() : void {
			Assert.assertTrue( flexUnit1Builder() is FlexUnit1Builder );
		}
		
		
		[Test(description="Ensure if a Fluint1 style class is passed to runnerForClass a Fluint1ClassRunner is returned")]
		public function testFluint1TestRunnerForClass() : void {
			var runner:IRunner;
			runner = runnerForClass( Fluint1Class );
			Assert.assertTrue( runner is Fluint1ClassRunner );
		}
		
		[Test(description="Ensure if a Fluint1 style suite is passed to runnerForClass a Fluint1ClassRunner is returned")]
		public function testFluint1SuiteRunnerForClass() : void {
			var runner:IRunner;
			runner = runnerForClass( Fluint1Suite );
			Assert.assertTrue( runner is Fluint1ClassRunner );
		}
		
		[Test(description="Ensure fluint1Builder returns the proper type")]
		public function testFluint1Builder() : void {
			try {
				Assert.assertTrue( fluint1Builder() is Fluint1Builder );
			} catch ( error : AssertionFailedError ) {
				Assert.assertTrue( fluint1Builder is NullBuilder );
			}
		}
	}
}