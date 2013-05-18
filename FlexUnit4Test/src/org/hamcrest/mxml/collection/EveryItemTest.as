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
package org.hamcrest.mxml.collection
{
    import org.hamcrest.mxml.AbstractMXMLMatcherTestCase;
    import org.hamcrest.mxml.number.Between;

    /*
       <EveryItem>
       <Between min="{ 100 }" max="{ 1000 }"/>
       </EveryItem>
     */
    public class EveryItemTest extends AbstractMXMLMatcherTestCase
    {
        private var matcher:EveryItem;

        [Before]
        public function createMatcher():void
        {
            matcher = new EveryItem();

            var between:Between = new Between();
            between.min = 100;
            between.max = 1000;

            matcher.matcher = between;
        }

        [Test]
        public function hasDescription():void
        {
            assertDescription("every item is a Number between <100> and <1000>", matcher);
        }

        [Test]
        public function matchedIsTrueIfTargetMatches():void
        {
            matcher.target = [ 100, 101, 999 ];

            assertMatched("matched if target matches", matcher);
        }

        [Test]
        public function matchedIsFalseIfTargetDoesNotMatch():void
        {
            matcher.target = [ 100, 101, 1001 ];

            assertNotMatched("not matched if target does not match", matcher);
        }

        [Test]
        public function mismatchDescriptionIsNullIfTargetMatches():void
        {
            matcher.target = [ 100, 101, 999 ];

            assertMatchedMismatchDescription(matcher);
        }

        [Test]
        public function mismatchDescriptionIsSetIfTargetDoesNotMatch():void
        {
            matcher.target = [ 100, 101, 1001 ];

            assertMismatchDescription("an item was <1001>", matcher);
        }
    }
}