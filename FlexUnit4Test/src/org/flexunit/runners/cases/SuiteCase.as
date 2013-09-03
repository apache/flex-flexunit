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
package org.flexunit.runners.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.FlexUnit4Builder;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runners.Suite;

	public class SuiteCase
	{
		// TODO: Is this good enough?
		[Test]
		public function testRunnerClassesCreation():void {
			var s:Suite = new Suite( new FlexUnit4Builder(), [SuiteCase,SuiteCase] );
			var d:IDescription = s.description;
			Assert.assertNotNull( d );
		}
		
		// TODO: Is this good enough?
		// TODO: This is throwing an error, due to being an empty test suite.
		[Ignore]
		[Test]
		public function testClassRunnerCreation():void {
			var s:Suite = new Suite( SuiteCase, new FlexUnit4Builder() );
			var d:IDescription = s.description;
			Assert.assertNotNull( d );
		}
		
		[Test(expects="org.flexunit.internals.runners.InitializationError")]
		public function testEmptySuite():void {
			var s:Suite = new Suite( new FlexUnit4Builder(), [] );
		}
		
		[Test(expects="Error")]
		public function testParamsError():void {
			var s:Suite = new Suite( [], [] );
		}
		
		// TODO: Do we test these here?
		
		[Test]
		public function testRun():void {
			// TODO: How do we test this?
		}
		
		[Test]
		public function testFilter():void {
			// TODO: How do we test this?
		}
		
		[Test]
		public function testFilterFails():void {
			// TODO: How do we test this?
		}
		
		[Test]
		public function testSort():void {
			// TODO: How do we test this?
		}
		
		[Test]
		public function testSortFails():void {
			// TODO: How do we test this?
		}
	}
}