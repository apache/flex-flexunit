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
package org.hamcrest.validation
{
    import mx.events.ValidationResultEvent;
    
    import org.flexunit.Assert;
    import org.flexunit.assertThat;
    import org.hamcrest.collection.arrayWithSize;
    import org.hamcrest.collection.emptyArray;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.core.not;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.hasProperties;
    import org.hamcrest.object.nullValue;
    import org.hamcrest.text.containsString;
    import org.hamcrest.text.emptyString;
    import org.hamcrest.validator.MatcherValidator;
    
    public class MatcherValidatorTest extends Assert
    {
        private var validator:MatcherValidator;
        
        [Before]
        public function setup():void
        {
            validator = new MatcherValidator();
            validator.required = false;
        }
        
        [Test]
        public function isValidIfNoMatcher():void
        {
            validator.matcher = null;
            
            var result:ValidationResultEvent = validator.validate("any value");
            assertThat(result.type, equalTo(ValidationResultEvent.VALID));
            assertThat(result.results, nullValue());
        }
        
        [Test]
        public function isValidIfValueMatchesMatcher():void
        {
            validator.matcher = not(emptyString());
            
            var result:ValidationResultEvent = validator.validate("a non-empty string");
            assertThat(result.type, equalTo(ValidationResultEvent.VALID));
            assertThat(result.results, nullValue());
        }
        
        [Test]
        public function isInvalidIfValueDoesNotMatch():void
        {
            validator.matcher = not(containsString("expected"));
            
            var result:ValidationResultEvent = validator.validate("unexpected");
            assertThat(result.type, equalTo(ValidationResultEvent.INVALID));
            assertThat(result.results, arrayWithSize(1));
        }
        
        [Test]
        public function whenInvalidHasErrorValidationResultWithMatcherDescription():void
        {
            validator.matcher = not(containsString("expected"));
            validator.errorCode = null;
            validator.errorMessage = null
            
            var result:ValidationResultEvent = validator.validate("unexpected");
            assertThat(result.results, hasItem(hasProperties({
                    isError: equalTo(true),
                    subField: equalTo(''),
                    errorCode: equalTo(null),
                    errorMessage: equalTo("not a string containing \"expected\"")
                })));
        }
        
        [Test]
        public function whenInvalidHasErrorValidationResultWithErrorMessage():void
        {
            validator.matcher = not(containsString("expected"));
            validator.errorCode = 'error.code';
            validator.errorMessage = 'any string but "expected"';
            
            var result:ValidationResultEvent = validator.validate("unexpected");
            assertThat(result.results, hasItem(hasProperties({
                    isError: equalTo(true),
                    subField: equalTo(''),
                    errorCode: equalTo('error.code'),
                    errorMessage: equalTo('any string but "expected"')
                })));
        }
    }
}