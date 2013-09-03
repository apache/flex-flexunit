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
package org.hamcrest.core
{

    import flash.errors.IllegalOperationError;

    import org.hamcrest.*;

    public class ThrowsTest extends AbstractMatcherTestCase
    {

        [Test]
        public function rethrowsUnexpectedError():void
        {

            var fn:Function = function():void
            {
                throw new IllegalOperationError("crumpets face inwards");
            };

            assertDoesNotMatch("", throws(ArgumentError), fn);
        }

        [Test]
        public function matchesIfFunctionThrowsExpectedError():void
        {

            var fn:Function = function():void
            {
                throw new ArgumentError("no waffles given");
            };

            assertMatches("", throws(ArgumentError), fn);
            assertMatches("", throws(Error), fn);
        }

        [Test]
        public function doesNotMatchesIfFunctionDoesNotThrowAnyError():void
        {

            var fn:Function = function():void
            {
                ; // dont throw an error
            };

            assertDoesNotMatch("", throws(ArgumentError), fn);
        }

        [Test]
        public function acceptsInstanceMethod():void
        {

            var complainer:Complainer = new Complainer();
            assertThat(complainer.complain, throws(Complaint))
        }
    }
}

internal class Complaint extends Error
{
    public function Complaint()
    {
        super("Complaint");
    }
}

internal class Complainer
{
    public function complain():void
    {
        throw new Complaint();
    }
}
