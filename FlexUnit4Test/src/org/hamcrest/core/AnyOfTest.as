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

    import org.hamcrest.*;
    import org.hamcrest.object.equalTo;

    public class AnyOfTest extends AbstractMatcherTestCase
    {

        [Test]
        public function evaluatesToTheTheLogicalDisjunctionOfTwoOtherMatchers():void
        {

            assertThat("good", anyOf(equalTo("bad"), equalTo("good")));
            assertThat("good", anyOf(equalTo("good"), equalTo("good")));
            assertThat("good", anyOf(equalTo("good"), equalTo("bad")));

            assertThat("good", not(anyOf(equalTo("bad"), equalTo("bad"))));
        }

        [Test]
        public function evaluatesToTheTheLogicalDisjunctionOfManyOtherMatchers():void
        {

            assertThat("good", anyOf(equalTo("bad"), equalTo("good"), equalTo("bad"), equalTo("bad"),
                equalTo("bad")));
            assertThat("good", not(anyOf(equalTo("bad"), equalTo("bad"), equalTo("bad"), equalTo("bad"),
                equalTo("bad"))));
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("(\"good\" or \"bad\" or \"ugly\")",
                anyOf(equalTo("good"), equalTo("bad"), equalTo("ugly")));
        }
    }
}