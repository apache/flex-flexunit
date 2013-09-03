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
package org.hamcrest.number
{
	import org.hamcrest.AbstractMatcherTestCase;

	public class IsNotANumberTest extends AbstractMatcherTestCase
	{
		[Test]
		public function shouldMatchNaN():void 
		{
			assertMatches("should match NaN", isNotANumber(), NaN); 
		}
		
		[Test]
		public function shouldNotMatchNumber():void 
		{
			assertDoesNotMatch("should not match 0", isNotANumber(), 0);
			assertDoesNotMatch("should not match positive number", isNotANumber(), 1);
			assertDoesNotMatch("should not match negative number", isNotANumber(), -1);
			assertDoesNotMatch("should not match positive infinity", isNotANumber(), Number.POSITIVE_INFINITY);
			assertDoesNotMatch("should not match negative infinity", isNotANumber(), Number.NEGATIVE_INFINITY);
		}
		
		[Test]
		public function shouldHaveAReadableDescription():void 
		{
			assertDescription("NaN", isNotANumber()); 
		}
	}
}