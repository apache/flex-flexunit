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

    public class DateBeforeTest extends AbstractMatcherTestCase
    {

        [Test]
        public function comparesDateValuesUsingDateBefore():void
        {
            assertMatches("before", dateBefore(new Date(2000, 1, 1)), new Date(1999, 1, 1));
            assertDoesNotMatch("not before", dateBefore(new Date(2000, 1, 1)), new Date(2011, 1, 1));
        }

        [Test]
        public function comparesDateValuesUsingDateBeforeOrEqualTo():void
        {
            assertMatches("before", dateBeforeOrEqual(new Date(2000, 1, 1)), new Date(2000, 1, 1));
            assertDoesNotMatch("not before", dateBeforeOrEqual(new Date(2000, 1, 1)), new Date(2011, 1, 1));
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("a date before <" + new Date(2000, 1, 1) + ">",
                dateBefore(new Date(2000, 1, 1)));
            assertDescription("a date before or equal to <" + new Date(2000, 1, 1) + ">",
                dateBeforeOrEqual(new Date(2000, 1, 1)));
        }
    }
}
