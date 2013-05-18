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

  public class IsTrueTest extends MatcherAssertTest
  {
    [Test]
    public function matchesTrueValue():void 
    {
      assertMatches("should match true", isTrue(), true);
    }
    
    [Test]
    public function matchesTruthyValue():void 
    {
      assertMatches("should match true", isTruthy(), true);
      assertMatches("should match object", isTruthy(), {});
      assertMatches("should match non-zero-length string", isTruthy(), " ");
    }
    
    [Test]
    public function doesNotMatchFalseyValue():void 
    {
      assertDoesNotMatch("should not match false", isTrue(), false);
      assertDoesNotMatch("should not match null", isTrue(), null);
      assertDoesNotMatch("should not match 0", isTrue(), 0);
      assertDoesNotMatch("should not match NaN", isTrue(), NaN);
      assertDoesNotMatch("should not match false", isTruthy(), false);
      assertDoesNotMatch("should not match null", isTruthy(), null);
      assertDoesNotMatch("should not match 0", isTruthy(), 0);
      assertDoesNotMatch("should not match NaN", isTruthy(), NaN);
    }
    
    [Test]
    public function hasAReadableDescription():void 
    {
      assertDescription("is true", isTrue());
      assertDescription("is true", isTruthy());
    }
  }
}