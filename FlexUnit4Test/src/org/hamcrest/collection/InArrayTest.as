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
package org.hamcrest.collection
{
	public class InArrayTest extends AbstractArrayMatcherTestCase
	{		
		[Test]
		public function matchesAnItemInArray():void 
		{
			assertMatches(
				"should match 'a' for array that contains 'a'", 
				inArray(['a', 'b', 'c']), 'a');
				
			assertMatches(
				"should match 'a' for array that contains 'a'", 
				inArray('a', 'b', 'c'), 'a');				
		}
		
		[Test]
		public function doesNotMatchIfNotInArray():void 
		{
			assertDoesNotMatch(
				"should not match 'b' for array that does not contain 'b'", 
				inArray(['b', 'c']), 'a');

			assertDoesNotMatch(
				"should not match 'b' for array that does not contain 'b'", 
				inArray('b', 'c'), 'a');
		}
				
		[Test]
		public function hasAReadableDescription():void
		{
			assertDescription('contained in ["a", "b", "c"]', inArray(['a', 'b', 'c']));
			assertDescription('contained in ["a", "b", "c"]', inArray('a', 'b', 'c'));
		}
		
		[Test]
		public function describesMismatch():void 
		{
			assertMismatch(
				'"a" was not contained in ["b", "c"]', 
				inArray('b', 'c'), 'a');
		}
	}
}