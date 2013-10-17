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
	import flex.lang.reflect.Klass;
	
	import net.digitalprimates.fluint.tests.TestCase;
	
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.Fluint1Builder;
	import org.flexunit.internals.builders.definitions.Fluint1Class;
	import org.flexunit.internals.builders.definitions.Fluint1Suite;
	import org.flexunit.internals.runners.Fluint1ClassRunner;
	
	public class Fluint1BuilderCase extends Fluint1Builder
	{
		protected var f1 : Fluint1Class;
		protected var f2 : Fluint1Suite;
		
		[Test(description="Ensure that if a Fluin1Class is passed we get back a Fluint class runner")]
		public function testRunnerForClassCase() : void {
			Assert.assertTrue( runnerForClass( Fluint1Class ) is Fluint1ClassRunner );
		}
		
		[Test(description="Ensure that if a fluint suite is passed we recieve a fluint class runner")]
		public function testRunnerForClassSuite() : void {
			Assert.assertTrue( runnerForClass( Fluint1Suite ) is Fluint1ClassRunner );
		}
		
		[Test(description="Ensure the runner can handle a real Fluint class")]
		public function canHandleClassRight() : void {
			Assert.assertTrue( canHandleClass( Fluint1Class ) );
		}
		
		[Test(description="Ensure the runner doesn't handle a non Fluint class")]
		public function canHandleClassWrong() : void {
			Assert.assertFalse( canHandleClass( Object ) );
		}
		
		[Test(description="Ensure that if a fluint class is passed, FU4 properly recoginizes it as such")]
		public function testIsFluintSuiteOrCase() : void {
			Assert.assertTrue( isFluintSuiteOrCase( new Klass( Fluint1Class ) ) );	
		}
		
		[Test(description="Ensure that if a fluint suite is passed, FU4 recognizes it as such")]
		public function testIsFluintSuiteOrCaseCase() : void {
			Assert.assertTrue( isFluintSuiteOrCase( new Klass ( Fluint1Suite ) ) );
		}
		
		[Test(description="Ensure that if a fluint class or suite is not passed FU4 does nto recognize it mistakenly")]
		public function testIsFluintSuiteOrCaseFalse() : void {
			Assert.assertFalse( isFluintSuiteOrCase( new Klass( Object ) ) );
		}
		
	}
}