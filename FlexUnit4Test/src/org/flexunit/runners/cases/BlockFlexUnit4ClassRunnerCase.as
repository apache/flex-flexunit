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
	import org.flexunit.runners.BlockFlexUnit4ClassRunner;

	//TODO: This entire runner needs to have tests written for it
	
	public class BlockFlexUnit4ClassRunnerCase
	{
		protected var blockFlexUnit4ClassRunner:BlockFlexUnit4ClassRunner;
		
		[Before(description="Creates a BlockFlexUnit4ClassRunner")]
		public function createBlockFlexUnit4ClassRunner():void {
			//blockFlexUnit4ClassRunner = new BlockFlexUnit4ClassRunner();
		}
		
		[After(description="Destroys a BlockFlexUnit4ClassRunner")]
		public function destroyBlockFlexUnit4ClassRunner():void {
			blockFlexUnit4ClassRunner = null;
		}
		
		[Test]
		public function test():void {
			
		}
	}
}