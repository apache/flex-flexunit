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
    import org.hamcrest.object.equalTo;

    public class IsArrayTest extends AbstractArrayMatcherTestCase
    {
        [Test]
        public function matchesAnArrayThatMatchesAllTheElementMatchers():void
        {
            assertMatches("should match array with matching elements",
                array(equalTo("a"), equalTo("b"), equalTo("c")), [ "a", "b", "c" ]);
        }

        [Test]
        public function doesNotMatchAnArrayWhenElementDoNotMatch():void
        {
            assertDoesNotMatch("should not match array with different elements",
                array(equalTo("a"), equalTo("b")), [ "b", "c" ]);
        }

        [Test]
        public function doesNotMatchAnArrayOfDifferentSize():void
        {
            assertDoesNotMatch("should not match larger array",
                array(equalTo("a"), equalTo("b")), [ "a", "b", "c" ]);
            assertDoesNotMatch("should not match smaller array",
                array(equalTo("a"), equalTo("b")), [ "a" ]);
        }

        [Test]
        public function doesNotMatchNull():void
        {
            assertDoesNotMatch("should not match null",
                array(equalTo("a")), null);
        }

        [Test]
        public function convertsLiteralValuesToEqualToMatcher():void
        {
            assertMatches("should convert items and match array with matching elements",
                array("a", "b", "c"), [ "a", "b", "c" ]);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("[\"a\", \"b\"]", array(equalTo("a"), equalTo("b")));
        }
        
        [Test]
        public function describesMismatches():void 
        {
            assertMismatch(
                "was [\"a\",\"b\",\"d\"]",
                array("a", "b", "c"), 
                ['a', 'b', 'd']);
        }
    }
}
