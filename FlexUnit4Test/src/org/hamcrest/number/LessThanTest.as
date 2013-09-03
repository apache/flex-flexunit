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
package org.hamcrest.number
{

    import org.hamcrest.AbstractMatcherTestCase;

    public class LessThanTest extends AbstractMatcherTestCase
    {

        [Test]
        public function comparesValuesUsingLessThan():void
        {
            assertMatches("less than", lessThan(10), 9);
            assertDoesNotMatch("not less than", lessThan(10), 11);
        }

        [Test]
        public function comparesValuesUsingLessThanOrEqualTo():void
        {
            assertMatches("less than", lessThanOrEqualTo(10), 10);
            assertDoesNotMatch("not less than", lessThanOrEqualTo(10), 11);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("a value less than <3>", lessThan(3));
            assertDescription("a value less than or equal to <3>", lessThanOrEqualTo(3));
        }

        [Test]
        public function hasMismatchDescription():void
        {
            assertMismatch("<3> was not less than <3>", lessThan(3), 3);
        }

        [Test]
        public function hasMismatchDescriptionIfNotEqualTo():void
        {
            assertMismatch("<4> was not less than or equal to <3>", lessThanOrEqualTo(3), 4);
        }
    }
}
