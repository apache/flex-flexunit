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

    import org.hamcrest.*;
    import org.hamcrest.core.not;

    public class IsSameTest extends AbstractMatcherTestCase
    {

        [Test]
        public function evaluatesToTrueIfArgumentIsReferenceToASpecificObject():void
        {
            var o1:Object = {};
            var o2:Object = {};

            assertThat(o1, sameInstance(o1));
            assertThat(o2, not(sameInstance(o1)));
        }

        [Test]
        public function returnsReadableDescriptionFromToString():void
        {
            assertDescription("same instance \"ARG\"", sameInstance("ARG"));
        }

        [Test]
        public function returnsReadableDescriptionFromToStringWhenInitializedithNull():void
        {
            assertDescription("same instance null", sameInstance(null));
        }
    }
}
