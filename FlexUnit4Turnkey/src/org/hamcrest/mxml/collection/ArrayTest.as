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
package org.hamcrest.mxml.collection
{
    import org.flexunit.assertThat;
    import org.hamcrest.mxml.collection.Array;
    import org.hamcrest.mxml.AbstractMXMLMatcherTestCase;
    import org.hamcrest.mxml.object.EqualTo;

    /*
       <Array>
       <EqualTo value="{ 1 }"/>
       <EqualTo value="{ 2 }"/>
       <EqualTo value="{ 3 }"/>
       </Array>
     */
    public class ArrayTest extends AbstractMXMLMatcherTestCase
    {
        private var matcher:org.hamcrest.mxml.collection.Array;

        [Before]
        public function createMatcher():void
        {
            matcher = new org.hamcrest.mxml.collection.Array();

            matcher.matchers = [ eq(1), eq(2), eq(3) ];
        }
        
        public function eq(value:Number):EqualTo
        {
            var m:EqualTo = new EqualTo();
            m.value = value;
            return m;
        }

        [Test]
        public function hasDescriptionWithNoMatchers():void
        {
            matcher.matchers = [];
            
            assertDescription("[]", matcher);
        }

        [Test]
        public function hasDescriptionWithMatchers():void
        {
            assertDescription("[<1>, <2>, <3>]", matcher);
        }

        [Test]
        public function matchedIsTrueIfTargetMatches():void
        {
            matcher.target = [ 1, 2, 3 ];

            assertMatched("matched if target matches", matcher);
        }

        [Test]
        public function matchedIsFalseIfTargetDoesNotMatch():void
        {
            matcher.target = [ 2, 3, 4 ];

            assertNotMatched("not matched if target does not match", matcher);
        }

        [Test]
        public function mismatchDescriptionIsNullIfTargetMatches():void
        {
            matcher.target = [ 1, 2, 3 ];

            assertMatchedMismatchDescription(matcher);
        }

        [Test]
        public function mismatchDescriptionIsSetIfTargetDoesNotMatch():void
        {
            matcher.target = [ 2, 3, 4 ];

            assertMismatchDescription("was [<2>,<3>,<4>]", matcher);
        }
    }
}