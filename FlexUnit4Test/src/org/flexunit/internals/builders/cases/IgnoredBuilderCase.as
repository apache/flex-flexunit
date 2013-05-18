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
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.IgnoredBuilder;
	import org.flexunit.internals.builders.IgnoredClassRunner;
	import org.flexunit.internals.builders.definitions.FlexUnit4Class;
	import org.flexunit.internals.builders.definitions.IgnoredClass;
	
	public class IgnoredBuilderCase
	{
		protected var ignoredClass : IgnoredClass;
		protected var ignoredBuilder : IgnoredBuilder;
		
		[Before]
		public function setUp() : void {
			ignoredBuilder = new IgnoredBuilder();
		}
		
		[After]
		public function tearDown() : void {
			ignoredBuilder = null;
		}
		
		[Test]
		public function testRunnerForClassIgnore() : void {
			Assert.assertTrue( ignoredBuilder.runnerForClass( IgnoredClass ) is IgnoredClassRunner );
		}
		
		[Test(description="Ensure the runner can handle a real Ignore class")]
		public function canHandleClassRight() : void {
			Assert.assertTrue( ignoredBuilder.canHandleClass( IgnoredClass ) );
		}
		
		[Test(description="Ensure the runner doesn't handle a non Ignore class")]
		public function canHandleClassWrong() : void {
			Assert.assertFalse( ignoredBuilder.canHandleClass( Object ) );
		}
	}
}