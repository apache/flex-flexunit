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
package org.hamcrest.date
{
    import org.hamcrest.AbstractMatcherTestCase;

    public class DateEqualTest extends AbstractMatcherTestCase
    {

        [Test]
        public function comparesDatesUsingDateEqual():void
        {
            assertMatches("equal", dateEqual(new Date(2002, 1, 1)), new Date(2002, 1, 1));
            assertDoesNotMatch("not equal", dateEqual(new Date(2002, 1, 1)), new Date(2000, 1, 1));
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("a date equal to <" + new Date(1980, 1, 1) + ">",
                dateEqual(new Date(1980, 1, 1)));
        }
    }
}
