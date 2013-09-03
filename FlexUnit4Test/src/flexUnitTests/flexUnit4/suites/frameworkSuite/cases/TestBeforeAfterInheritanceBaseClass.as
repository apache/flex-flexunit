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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	public class TestBeforeAfterInheritanceBaseClass extends TestBeforeAfterInheritanceBaseBaseClass
	{
		[Before(order=1)]
		public function beginOneParent():void {
			TestBeforeAfterInheritance.setupOrderArray.push("first");
		}
		
		[Before(order=2)]
		public function beginTwoParent():void {
			TestBeforeAfterInheritance.setupOrderArray.push("second");
		}
		
		
		[After(order=1)]
		public function afterOneParent():void {
			TestBeforeAfterInheritance.setupOrderArray.push("nineth");
		}
		
		[After(order=2)]
		public function afterTwoParent():void {
			TestBeforeAfterInheritance.setupOrderArray.push("tenth");
		}
	}
}