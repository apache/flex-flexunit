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

    import flexunit.framework.*;

    import org.hamcrest.AbstractMatcherTestCase;
    import org.hamcrest.assertThat;
    import org.hamcrest.object.equalTo;

    public class AllOfTest extends AbstractMatcherTestCase
    {

        [Test]
        public function evaluatesToTheTheLogicalConjunctionOfTwoOtherMatchers():void
        {

            assertThat("good", allOf(equalTo("good"), equalTo("good")));

            assertThat("good", not(allOf(equalTo("bad"), equalTo("good"))));
            assertThat("good", not(allOf(equalTo("good"), equalTo("bad"))));
            assertThat("good", not(allOf(equalTo("bad"), equalTo("bad"))));
        }

        [Test]
        public function evaluatesToTheTheLogicalConjunctionOfManyOtherMatchers():void
        {

            assertThat("good", allOf(equalTo("good"), equalTo("good"), equalTo("good"), equalTo("good"),
                equalTo("good")));
            assertThat("good", not(allOf(equalTo("good"), equalTo("good"), equalTo("bad"), equalTo("good"),
                equalTo("good"))));
        }

        [Test]
        public function hasAReadableDescription():void
        {

            assertDescription("(\"good\" and \"bad\" and \"ugly\")",
                allOf(equalTo("good"), equalTo("bad"), equalTo("ugly")));
        }

        [Test]
        public function mismatchDescriptionDescribesFirstFailingMatch():void
        {

            assertMismatch("\"good\" was \"bad\"", allOf(equalTo("bad"), equalTo("good")), "bad");
        }
    }
}