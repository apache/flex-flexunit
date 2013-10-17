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
package org.hamcrest.text
{
    import org.hamcrest.AbstractMatcherTestCase;
    
    public class EmptyStringTest extends AbstractMatcherTestCase
    {
        
        [Test]
        public function matchesAZeroLengthString():void
        {
            assertMatches("zero length string", emptyString(), "");
        }
        
        [Test]
        public function matchesAWhitespaceOnlyString():void
        {
            assertMatches("whitespace only string (spaces)", emptyString(), "   ");
            assertMatches("whitespace only string (tabs)", emptyString(), "\t\t");
            assertMatches("whitespace only string (carriage return)", emptyString(), "\r\r");
            assertMatches("whitespace only string (line feed)", emptyString(), "\n\n");
            assertMatches("whitespace only string (mixed)", emptyString(), "\r\t\n ");
        }
        
        [Test]
        public function doesNotMatchAnStringWithCharacters():void
        {
            assertDoesNotMatch("non-zero length, no whitespace", emptyString(), "hello");
            assertDoesNotMatch("with leading whitespace", emptyString(), "   leading");
            assertDoesNotMatch("with trailing whitespace", emptyString(), "trailing  ");
            assertDoesNotMatch("internal whitespace", emptyString(), "internal \t whitespace");
        }
        
        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("an empty String", emptyString());
        }
    
    }
}