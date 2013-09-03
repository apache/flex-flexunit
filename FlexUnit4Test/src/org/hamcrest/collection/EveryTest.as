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
package org.hamcrest.collection
{
    import mx.collections.ArrayCollection;
    
    import org.flexunit.Assert;
    import org.hamcrest.*;
    import org.hamcrest.core.not;
    import org.hamcrest.text.containsString;
    import org.hamcrest.text.re;

    public class EveryTest extends AbstractArrayMatcherTestCase
    {
        [Test]
        public function matchesWhereEveryElementMatches():void
        {
            assertMatches(
                "should match array where every item contains 'a'", 
                everyItem(containsString("a")), 
                [ "AaA", "BaB", "CaC" ]); 
        }
        
        [Test]
        public function doesNotMatchWhereAnyElementDoesNotMatch():void
        {
            assertDoesNotMatch(
                "should not match array where every item does not contain 'b'",
                everyItem(not(containsString('b'))),
                [ "ABA", "BbB", "CbC" ]);
        }

        [Test]
        public function isAlwaysTrueForEmptyLists():void
        {
            assertMatches(
                "should match empty array", 
                everyItem(containsString('a')), 
                []);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription(
                "every item is a string containing \"a\"",
                everyItem(containsString("a")));
        }
        
        [Test]
        public function describesMismatch():void 
        {
            assertMismatch(
                "an item was \"BbB\"", 
                everyItem(containsString("a")), 
                ["BbB"]);
        }
    }
}
