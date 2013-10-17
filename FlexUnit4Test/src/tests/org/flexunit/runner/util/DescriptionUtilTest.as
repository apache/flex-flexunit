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
package tests.org.flexunit.runner.util {
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.runner.Description;
	import org.flexunit.runner.IDescription;
	import org.flexunit.utils.DescriptionUtil;
	
	import tests.flex.lang.reflect.klass.KlassWithInvalidData;

	public class DescriptionUtilTest {
		[Test]
		public function shouldFindNameWhenStandardTest():void {
			var desc:IDescription = Description.createTestDescription( KlassWithInvalidData, "tests.flex.lang.reflect.klass::KlassWithInvalidData.shouldFindZeroFields" );
			assertEquals( "shouldFindZeroFields", DescriptionUtil.getMethodNameFromDescription( desc ) );
		}

		[Test]
		public function shouldFindNameWhenParameterizedTest():void {
			var desc:IDescription = Description.createTestDescription( KlassWithInvalidData, "tests.flex.lang.reflect.klass::KlassWithInvalidData.shouldFindZeroFields (5,3)" );
			assertEquals( "shouldFindZeroFields", DescriptionUtil.getMethodNameFromDescription( desc ) );
		}

		[Test]
		public function shouldFindNameWhenParameterizedTestWithDots():void {
			var desc:IDescription = Description.createTestDescription( KlassWithInvalidData, "tests.flex.lang.reflect.klass::KlassWithInvalidData.shouldFindZeroFields (5.7,3.4)" );
			assertEquals( "shouldFindZeroFields", DescriptionUtil.getMethodNameFromDescription( desc ) );
		}

		[Test]
		public function shouldFindNameWhenParameterizedTestWithSpaces():void {
			var desc:IDescription = Description.createTestDescription( KlassWithInvalidData, "tests.flex.lang.reflect.klass::KlassWithInvalidData.shouldFindZeroFields (5,3, 5)" );
			assertEquals( "shouldFindZeroFields", DescriptionUtil.getMethodNameFromDescription( desc ) );
		}
	}
}