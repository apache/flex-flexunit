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
package org.hamcrest.mxml
{
    import org.flexunit.Assert;

    public class AbstractMXMLMatcherTestCase extends Assert
    {
        public function assertMatched(message:String, matcher:MXMLMatcher):void
        {
            assertTrue(message, matcher.matched);
        }

        public function assertNotMatched(message:String, matcher:MXMLMatcher):void
        {
            assertFalse(message, matcher.matched);
        }

        public function assertDescription(expected:String, matcher:MXMLMatcher):void
        {
            assertEquals("Expected description", expected, matcher.description);
        }

        public function assertMatchedMismatchDescription(matcher:MXMLMatcher):void
        {
            assertTrue("Precondition: Matcher should be matched", matcher.matched);
            assertEquals("Expected mismatch description to be an empty string", "", matcher.mismatchDescription);
        }

        public function assertMismatchDescription(expected:String, matcher:MXMLMatcher):void
        {
            assertFalse("Precondition: Matcher should not be matched", matcher.matched);
            assertEquals("Expected mismatch description", expected, matcher.mismatchDescription);
        }
    }
}