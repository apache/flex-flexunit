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

    public class GreaterThanTest extends AbstractMatcherTestCase
    {

        [Test]
        public function comparesValuesUsingGreaterThan():void
        {
            assertMatches("greater than", greaterThan(10), 11);
            assertDoesNotMatch("not greater than", greaterThan(10), 10);
        }

        [Test]
        public function comparesValuesUsingGreaterThanOrEqualTo():void
        {
            assertMatches("greater than", greaterThanOrEqualTo(10), 10);
            assertDoesNotMatch("not greater than", greaterThanOrEqualTo(10), 9);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("a value greater than <3>", greaterThan(3));
            assertDescription("a value greater than or equal to <3>", greaterThanOrEqualTo(3));
        }

        [Test]
        public function hasMismatchDescription():void
        {
            assertMismatch("<3> was not greater than <3>", greaterThan(3), 3);
        }

        [Test]
        public function hasMismatchDescriptionIfNotEqualTo():void
        {
            assertMismatch("<2> was not greater than or equal to <3>", greaterThanOrEqualTo(3), 2);
        }
    }
}
