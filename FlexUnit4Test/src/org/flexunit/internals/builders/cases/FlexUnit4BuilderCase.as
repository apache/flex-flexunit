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
	import org.flexunit.internals.builders.FlexUnit4Builder;
	import org.flexunit.runners.BlockFlexUnit4ClassRunner;
	
	import org.flexunit.internals.builders.definitions.FlexUnit4Class;
	
	public class FlexUnit4BuilderCase extends FlexUnit4Builder
	{
		protected var t1 : FlexUnit4Class;
		
		[Test(description="Ensure that if a FlexUnit4 style class is passed we return a FlexUnit4 Runner")]
		public function testRunnerForClass() : void {
			Assert.assertTrue( runnerForClass( FlexUnit4Class ) is BlockFlexUnit4ClassRunner );
		}
	}
}