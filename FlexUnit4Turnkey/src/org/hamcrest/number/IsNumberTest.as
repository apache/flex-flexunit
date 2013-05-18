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

	public class IsNumberTest extends AbstractMatcherTestCase
	{		
		[Test]
		public function shouldMatchNumber():void 
		{
			assertMatches("should match 0", isNumber(), 0);
			assertMatches("should match positive number", isNumber(), 1);
			assertMatches("should match negative number", isNumber(), -1);
			assertMatches("should match maximum number", isNumber(), Number.MAX_VALUE);
			assertMatches("should match minimum number", isNumber(), Number.MIN_VALUE);
		}
		
		[Test]
		public function shouldNotMatchNaN():void 
		{
			assertDoesNotMatch("should not match NaN", isNumber(), NaN);
		}
		
		[Test]
		public function shouldNotMatchInfinity():void 
		{
			assertDoesNotMatch("should not match positive infinity", isNumber(), Number.POSITIVE_INFINITY);
			assertDoesNotMatch("should not match negative infinity", isNumber(), Number.NEGATIVE_INFINITY);
		}
		
		[Test]
		public function shouldNotMatchNonNumber():void 
		{
			assertDoesNotMatch("should not match `true`", isNumber(), true);
			assertDoesNotMatch("should not match `false`", isNumber(), false);
			assertDoesNotMatch("should not match Object", isNumber(), {});
			assertDoesNotMatch("should not match Class", isNumber(), Number);
		}
		
		[Test]
		public function shouldHaveAReadableDescription():void 
		{
			assertDescription("a Number", isNumber());
		}
	}
}