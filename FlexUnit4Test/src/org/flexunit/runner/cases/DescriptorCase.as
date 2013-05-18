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
package org.flexunit.runner.cases
{
	
	import org.flexunit.Assert;
	import org.flexunit.runner.Descriptor;

	public class DescriptorCase
	{
		//TODO: Ensure that these tests and this test case are being implemented correctly
		
		[Test(description="Ensure the Descriptor is successfully created with no parameters being passed")]
		public function createDescriptorNoParamsTest():void {
			var descriptor:Descriptor = new Descriptor();
			
			Assert.assertEquals("", descriptor.path);
			Assert.assertEquals("", descriptor.suite);
			Assert.assertEquals("", descriptor.method);
		}
		
		[Test(description="Ensure the Descriptor is successfully created with one parameter being passed")]
		public function createDescriptorOneParamTest():void {
			var descriptor:Descriptor = new Descriptor("a");
			
			Assert.assertEquals("a", descriptor.path);
			Assert.assertEquals("", descriptor.suite);
			Assert.assertEquals("", descriptor.method);
		}
		
		[Test(description="Ensure the Descriptor is successfully created with two parameters being passed")]
		public function createDescriptorTwoParamsTest():void {
			var descriptor:Descriptor = new Descriptor("a", "b");
			
			Assert.assertEquals("a", descriptor.path);
			Assert.assertEquals("b", descriptor.suite);
			Assert.assertEquals("", descriptor.method);
		}
		
		[Test(description="Ensure the Descriptor is successfully created with all parameters being passed")]
		public function createDescriptorAllParamsTest():void {
			var descriptor:Descriptor = new Descriptor("a", "b", "c");
			
			Assert.assertEquals("a", descriptor.path);
			Assert.assertEquals("b", descriptor.suite);
			Assert.assertEquals("c", descriptor.method);
		}
	}
}