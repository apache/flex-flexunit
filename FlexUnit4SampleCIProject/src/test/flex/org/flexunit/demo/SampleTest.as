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
package org.flexunit.demo {

   import org.flexunit.Assert;
   
   public class SampleTest {
      [Test]
      public function testSampleFailure() : void {
         Assert.fail("FAIL! - This is a sample test that will fail.");
      }

      [Test]
      public function testSampleError() : void {
         throw new Error("ERROR! - This is an error");
      }
      
      [Ignore]
      [Test]
      public function testSampleIgnore() : void {
         
      }
   }
}