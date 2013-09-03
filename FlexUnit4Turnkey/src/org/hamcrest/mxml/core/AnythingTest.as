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
package org.hamcrest.mxml.core
{
    import org.hamcrest.mxml.AbstractMXMLMatcherTestCase;

    /*
       <Anything />
     */
    public class AnythingTest extends AbstractMXMLMatcherTestCase
    {
        private var matcher:Anything;

        [Before]
        public function createMatcher():void
        {
            matcher = new Anything();
        }

        [Test]
        public function hasDescription():void
        {
            assertDescription("ANYTHING", matcher);
        }

        [Test]
        public function matchedIsTrue():void
        {
            matcher.target = 4;

            assertMatched("matched if target matches", matcher);
        }

        [Test]
        public function mismatchDescriptionIsNullIfTargetMatches():void
        {
            matcher.target = 4;

            assertMatchedMismatchDescription(matcher);
        }
    }
}