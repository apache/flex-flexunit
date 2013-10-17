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
    import org.hamcrest.mxml.object.EqualTo;

    /*
       <HasItems>
       <EqualTo value="{ 3 }"/>
       <EqualTo value="{ 4 }"/>
       </HasItems>
     */
    public class HasItemsTest extends AbstractMXMLMatcherTestCase
    {
        private var matcher:HasItems;

        [Before]
        public function createMatcher():void
        {
            matcher = new HasItems();

            var eq1:EqualTo = new EqualTo();
            eq1.value = 1;

            var eq3:EqualTo = new EqualTo();
            eq3.value = 3;

            matcher.matchers = [ eq1, eq3 ];
        }

        [Test]
        public function hasDescription():void
        {
            assertDescription("(an Array containing <1> and an Array containing <3>)", matcher);
        }

        [Test]
        public function matchedIsTrueIfTargetMatches():void
        {
            matcher.target = [ 1, 2, 3 ];

            assertMatched("matched if target matches", matcher);
        }

        [Test]
        public function matchedIsFalseIfTargetDoesNotMatch():void
        {
            matcher.target = [ 4, 5, 6 ];

            assertNotMatched("not matched if target does not match", matcher);
        }

        [Test]
        public function mismatchDescriptionIsNullIfTargetMatches():void
        {
            matcher.target = [ 1, 2, 3 ];

            assertMatchedMismatchDescription(matcher);
        }

        [Test]
        public function mismatchDescriptionIsSetIfTargetDoesNotMatch():void
        {
            matcher.target = [ 4, 5, 6 ];

            assertMismatchDescription("an Array containing <1> was [<4>,<5>,<6>]", matcher);
        }
    }
}