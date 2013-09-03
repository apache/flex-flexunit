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
package org.hamcrest
{

    public class TypeSafeMatcherTest extends AbstractMatcherTestCase
    {

        [Test]
        public function classMatchesSafelyIfTypesMatch():void
        {

            var called:Boolean = false;

            var matcher:TypeSafeMatcher = new TypeSafeMatcherForTesting(String, function(item:Object):Boolean
                {
                    called = true;
                    return true;
                });

            matcher.matches("hello");

            assertThat("TypeSafeMatcher.matchesSafely was not called", called);
        }
    }
}

import org.hamcrest.TypeSafeMatcher;

internal class TypeSafeMatcherForTesting extends TypeSafeMatcher
{

    private var _fn:Function;

    public function TypeSafeMatcherForTesting(type:Class, fn:Function)
    {
        super(type);
        _fn = fn;
    }

    override public function matchesSafely(item:Object):Boolean
    {
        return _fn(item);
    }
}
