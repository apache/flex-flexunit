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
    import org.hamcrest.AbstractMatcherTestCase;

    public class IsArrayWithSizeTest extends AbstractArrayMatcherTestCase
    {
        [Test]
        public function matchesWhenSizeIsCorrect():void
        {
            assertMatches("correct size", arrayWithSize(3), [ 1, 2, 3 ]);
            assertDoesNotMatch("incorrect size", arrayWithSize(2), [ 1, 2, 3 ]);
        }

        [Test]
        public function providesConvenientShortcutForArrayWithSizeEqualTo():void
        {
            assertMatches("correct size", arrayWithSize(3), [ 1, 2, 3 ]);
            assertDoesNotMatch("incorrect size", arrayWithSize(2), [ 1, 2, 3 ]);
        }

        [Test]
        public function emptyArrays():void
        {
            assertMatches("correct size", emptyArray(), []);
            assertDoesNotMatch("incorrect size", emptyArray(), [ 1 ]);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("an Array with size <3>", arrayWithSize(3));
            assertDescription("an empty Array", emptyArray());
        }
        
        [Test]
        public function describesMismatch():void 
        {
            assertMismatch(
                "size was <4>", 
                arrayWithSize(3),
                [1, 2, 3, 4]);
        }
    }
}
