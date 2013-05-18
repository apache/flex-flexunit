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
  import org.hamcrest.MatcherAssertTest;

  public class IsFalseTest extends MatcherAssertTest
  {
    [Test]
    public function matchesFalseValue():void 
    {
      assertMatches("should match false", isFalse(), false);
    }

    [Test]
    public function matchesFalseyValue():void 
    {
      assertMatches("should match false", isFalsey(), false);
      assertMatches("should match null", isFalsey(), null);
      assertMatches("should match 0", isFalsey(), 0);
      assertMatches("should match NaN", isFalsey(), NaN);
    }
    
    [Test]
    public function doesNotMatchTruthyValue():void 
    {
      assertDoesNotMatch("should not match true", isFalse(), true);
      assertDoesNotMatch("should not match object", isFalse(), {});
      assertDoesNotMatch("should not match non-zero-length string", isFalse(), " ");
      assertDoesNotMatch("should not match true", isFalsey(), true);
      assertDoesNotMatch("should not match object", isFalsey(), {});
      assertDoesNotMatch("should not match non-zero-length string", isFalsey(), " ");
    }
    
    [Test]
    public function hasAReadableDescription():void 
    {
      assertDescription("is false", isFalse());
      assertDescription("is false", isFalsey());
    }
  }
}