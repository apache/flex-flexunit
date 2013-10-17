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
package org.hamcrest.mxml.object
{
    import flash.events.Event;
    
    import org.hamcrest.mxml.AbstractMXMLMatcherTestCase;
    
    /*
       <HasProperty property="" />
       <HasProperty property="" value="" />
     */
    public class HasPropertyTest extends AbstractMXMLMatcherTestCase
    {
        private var matcher:HasProperty;
        
        [Before]
        public function createMatcher():void
        {
            matcher = new HasProperty();
            matcher.property = "type";
        }
        
        [Test]
        public function hasDescription():void
        {
            assertDescription('has property "type"', matcher);
        }
        
        [Test]
        public function matchedIsTrueIfTargetMatches():void
        {
            matcher.target = new Event(Event.ADDED);
            
            assertMatched("matched if target matches", matcher);
        }
        
        [Test]
        public function matchedIsFalseIfTargetDoesNotMatch():void
        {
            matcher.target = null;
            
            assertNotMatched("not matched if target does not match", matcher);
        }
        
        [Test]
        public function mismatchDescriptionIsNullIfTargetMatches():void
        {
            matcher.target = new Event(Event.ADDED);
            
            assertMatchedMismatchDescription(matcher);
        }
        
        [Test]
        public function mismatchDescriptionIsSetIfTargetDoesNotMatch():void
        {
            matcher.target = null;
            
            assertMismatchDescription("no property \"type\" on null", matcher);
        }
    }
}
