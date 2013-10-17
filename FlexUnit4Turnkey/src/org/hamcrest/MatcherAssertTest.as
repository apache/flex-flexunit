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

    import org.hamcrest.object.equalTo;
    import org.hamcrest.text.startsWith;

    public class MatcherAssertTest extends AbstractMatcherTestCase
    {

        [Test]
        public function includesDescriptionOfTestedValueInErrorMessage():void
        {

            var expected:String = "expected";
            var actual:String = "actual";
            var expectedMessage:String = "identifier\nExpected: \"expected\"\n     but: was \"actual\"";

            try
            {
                assertThat("identifier", actual, equalTo(expected));
                fail("should have failed");
            }
            catch (error:AssertionError)
            {
                assertTrue(startsWith(expectedMessage).matches(error.message));
            }
        }

        [Test]
        public function descriptionCanBeElided():void
        {

            var expected:String = "expected";
            var actual:String = "actual";
            var expectedMessage:String = "Expected: \"expected\"\n     but: was \"actual\"";

            try
            {
                assertThat(actual, equalTo(expected));
                fail("should have failed");
            }
            catch (error:AssertionError)
            {
                assertTrue(startsWith(expectedMessage).matches(error.message));
            }
        }

        [Test]
        public function canTestBooleanDirectly():void
        {

            assertThat("success reason message", true);

            try
            {
                assertThat("failing reason message", false);
                fail("should have failed");
            }
            catch (error:AssertionError)
            {
                assertEquals("failing reason message", error.message);
            }
        }

        [Test]
        public function includesMismatchDescription():void
        {

            var matcher:Matcher = new MatcherForTestingAssertThat();
            var expectedMessage:String = "Expected: something cool\n     but: not cool"

            try
            {
                assertThat("value", matcher);
                fail("should have failed");
            }
            catch (error:AssertionError)
            {
                assertEquals(expectedMessage, error.message);
            }
        }
    }
}

import org.hamcrest.BaseMatcher;
import org.hamcrest.Description;

internal class MatcherForTestingAssertThat extends BaseMatcher
{

    override public function matches(item:Object):Boolean
    {
        return false;
    }

    override public function describeTo(description:Description):void
    {
        description.appendText("something cool");
    }

    override public function describeMismatch(item:Object, mismatchDescription:Description):void
    {
        mismatchDescription.appendText("not cool");
    }
}

