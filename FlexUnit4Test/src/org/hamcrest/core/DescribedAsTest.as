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
package org.hamcrest.core
{

    import org.hamcrest.*;
    import org.flexunit.Assert;

    public class DescribedAsTest extends AbstractMatcherTestCase
    {

        [Test]
        public function overridesDescriptionOfOtherMatcherWithThatPassedToConstructor():void
        {

            var m1:Matcher = describedAs("m1 description", anything());
            var m2:Matcher = describedAs("m2 description", not(anything()));

            assertDescription("m1 description", m1);
            assertDescription("m2 description", m2);
        }

        [Test]
        public function appendsValuesToDescription():void
        {

            var matcher:Matcher = describedAs("value 1 = %0, value 2 = %1", anything(), 33, 97);

            assertDescription("value 1 = <33>, value 2 = <97>", matcher);
        }

        [Test]
        public function delegatesMatchingToAnotherMatcher():void
        {

            var m1:Matcher = describedAs("irrelevant", anything());
            var m2:Matcher = describedAs("irrelevant", not(anything()));

            assertTrue(m1.matches(new Object()));
            assertFalse(m2.matches("hi"));
        }
    }
}