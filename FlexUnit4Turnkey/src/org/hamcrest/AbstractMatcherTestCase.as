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
package org.hamcrest
{

    import org.flexunit.Assert;

    public class AbstractMatcherTestCase extends Assert
    {

        public function assertMatches(message:String, matcher:Matcher, arg:Object):void
        {
            assertTrue(message, matcher.matches(arg));
        }

        public function assertDoesNotMatch(message:String, matcher:Matcher, arg:Object):void
        {
            assertFalse(message, matcher.matches(arg));
        }

        public function assertDescription(expected:String, matcher:Matcher):void
        {
            var description:Description = new StringDescription();
            description.appendDescriptionOf(matcher);
            assertEquals("Expected description", expected, description.toString());
        }

        public function assertMismatch(expected:String, matcher:Matcher, arg:Object):void
        {
            assertFalse("Precondition: Matcher should not match item.", matcher.matches(arg));

            var description:Description = new StringDescription();            
            description.appendMismatchOf(matcher, arg);
            assertEquals("Expected mismatch description", expected, description.toString());
        }
    }
}
