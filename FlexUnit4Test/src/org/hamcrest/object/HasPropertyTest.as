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
package org.hamcrest.object
{
    import org.hamcrest.AbstractMatcherTestCase;
    import org.hamcrest.core.anything;
    
    public class HasPropertyTest extends AbstractMatcherTestCase
    {
        private var shouldMatch:Object;
        private var shouldNotMatch:Object;
        
        [Before]
        public function setup():void
        {
            shouldMatch = new PropertyTester("is expected");
            shouldNotMatch = new PropertyTester("not expected");
        }
        
        [Test]
        public function matchesObjectWithMatchedNamedProperty():void
        {
            assertMatches("with property only",
                hasProperty('property'), 
                { property: false });
            
            assertDoesNotMatch("without property", 
                hasProperty('property'), 
                {});
            
            assertMismatch('no property "property" on <[object Object]>',
                hasProperty("property"),
                {  });
            
            assertMismatch('no property "property" on null',
                hasProperty("property"),
                null);
        }
        
        [Test]
        public function matchesObjectWithMatchedNamedPropertyAndValue():void 
        {
            assertMatches("with property",
                hasProperty("property", equalTo("is expected")),
                shouldMatch);
            
            assertMismatch('property "property" was "not expected"',
                hasProperty("property", equalTo("is expected")),
                shouldNotMatch);
            
            assertMismatch('no property "property" on null object',
                hasProperty("property", equalTo("is expected")),
                null);
        }
        
        [Test]
        public function doesNotMatchObjectWithoutNamedProperty():void
        {
            assertMismatch('no property "nonExistantProperty"',
                hasProperty("nonExistantProperty", anything()),
                shouldNotMatch);
        }
        
        [Ignore]
        [Test]
        public function doesNotMatchWriteOnlyProperty():void
        {
            assertMismatch('property "writeOnlyProperty" is not readable',
                hasProperty("writeOnlyProperty", anything()),
                shouldNotMatch);
        }
        
        [Test]
        public function describeTo():void
        {
            assertDescription('has property "property"', 
                hasProperty("property"));
            
            assertDescription('has property "property" with <true>',
                hasProperty("property", equalTo(true)));
        }
        
        [Test]
        public function describesMissingPropertyMismatch():void
        {
            assertMismatch('no property "honk"', hasProperty("honk", anything()), shouldNotMatch);
        }
        
        [Test]
        public function describesMissingPropertyMismatchForNull():void
        {
            assertMismatch('no property "honk" on null object', hasProperty("honk", anything()), null);
        }
        
        [Test]
        public function evaluatesToTrueIfArgumentHasOwnProperty():void
        {
            assertMatches("has property",
                hasProperty("value"),
                { value: "one" });
            
            assertDoesNotMatch("does not have property",
                hasProperty("value"),
                { other: true });
            
            assertMatches("has property",
                hasProperty("value", equalTo("one")),
                { value: "one" });
            
            assertDoesNotMatch("does not have property",
                hasProperty("value", equalTo(false)),
                { other: true });
        }
        
        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription('has property "value"',
                hasProperty("value"));
            
            assertDescription('has property "value" with <3>',
                hasProperty("value", equalTo(3)));
        }
        
        [Test]
        public function wrapsValueInEqualToIfNotAMatcher():void
        {
            assertMatches("with property",
                hasProperty("property", "is expected"),
                shouldMatch);
            
            assertMismatch('property "property" was "not expected"',
                hasProperty("property", "is expected"),
                shouldNotMatch);
            
            assertMismatch('no property "property" on null object',
                hasProperty("property", "is expected"),
                null);
        }
    }
}

internal class PropertyTester
{
    
    private var _property:String;
    
    public function PropertyTester(value:String)
    {
        _property = value;
    }
    
    public function get property():String
    {
        return _property;
    }
    
    public function set property(value:String):void
    {
        _property = value;
    }
    
    public function set writeOnlyProperty(value:Number):void
    {
        ;
    }
}
