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
package org.hamcrest.text
{
    import org.hamcrest.*;
    import org.hamcrest.core.*;

    import org.flexunit.Assert;

    public class StringContainsTest extends AbstractMatcherTestCase
    {
        private static const EXCERPT:String = "EXCERPT";

        private var stringContains:Matcher;
        private var stringContainsIgnoreCase:Matcher;

        [Before]
        public function setUp():void
        {
            stringContains = containsString(EXCERPT);
            stringContainsIgnoreCase = containsString(EXCERPT, true);
        }

        [Test]
        public function evaluatesToTrueIfArgumentContainsSpecifiedSubstring():void
        {
            assertMatches("should be true if excerpt at beginning",
                stringContains, EXCERPT + "END");

            assertMatches("should be true if excerpt at end",
                stringContains, "START" + EXCERPT);

            assertMatches("should be true if excerpt in middle",
                stringContains, "START" + EXCERPT + "END");

            assertMatches("should be true if excerpt is repeated",
                stringContains, EXCERPT + EXCERPT);

            assertDoesNotMatch("should not be true if excerpt is not in string",
                stringContains, "Something else");

            assertDoesNotMatch("should not be true if part of excerpt is in string",
                stringContains, EXCERPT.substring(1));
        }
        
        [Test]
        public function evaluatesToTrueIfArgumentContainsSpecifiedSubstringIgnoringCase():void 
        {
            assertMatches("should be true if excerpt at beginning",
                stringContainsIgnoreCase, 
                EXCERPT.toLowerCase() + "END");

            assertMatches("should be true if excerpt at end",
                stringContainsIgnoreCase, 
                "START" + EXCERPT.toLowerCase());

            assertMatches("should be true if excerpt in middle",
                stringContainsIgnoreCase, 
                "START" + EXCERPT.toLowerCase() + "END");

            assertMatches("should be true if excerpt is repeated",
                stringContainsIgnoreCase, 
                EXCERPT.toLowerCase() + EXCERPT);

            assertDoesNotMatch("should not be true if excerpt is not in string",
                stringContainsIgnoreCase, 
                "Something else");

            assertDoesNotMatch("should not be true if part of excerpt is in string",
                stringContainsIgnoreCase, 
                EXCERPT.toLowerCase().substring(1));
        }

        [Test]
        public function evaluatesToTrueIfArgumentIsEqualToSubstring():void
        {
            assertMatches("should be true if excerpt is entire string", stringContains, EXCERPT);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("a string containing \"EXCERPT\"", stringContains);
        }
    }
}
