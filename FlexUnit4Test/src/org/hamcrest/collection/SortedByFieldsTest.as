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
package org.hamcrest.collection
{
    import mx.collections.ArrayCollection;
    import mx.collections.SortField;
    
    import org.hamcrest.AbstractMatcherTestCase;
    import org.hamcrest.Matcher;
    
    public class SortedByFieldsTest extends AbstractMatcherTestCase
    {
        override public function assertMatches(message:String, matcher:Matcher, arg:Object):void 
        {
            super.assertMatches(message, matcher, arg);

            // To ensure that the matcher properly matches non-Array collecitons,
            // run the same test again, this time using an ArrayCollection.
            if (arg is Array) 
            {
                super.assertMatches(message + " (as ArrayCollection)", matcher, new ArrayCollection(arg as Array));
            }
        }
        
        [Test]
        public function shouldMatchArrayInSortedOrderFor1SortField():void 
        {
            assertMatches("should match array in sorted order for 1 SortField",
                sortedByFields([ new SortField("value") ]), 
                [
                { value: "Cats" },
				{ value: "bats" },
				{ value: "cats" },				
				{ value: "hats" }
                ]);
        }
        
        [Test]
        public function shouldMatchArrayInSortedOrderFor2SortFields():void
        {
            assertMatches("should match array in sorted order for 2 SortFields",
                sortedByFields([ new SortField("value1"), new SortField("value2") ]), 
                [
                { value1: "1", value2: "1" },
				{ value1: "1", value2: "2" },
				{ value1: "2", value2: "2" },				
				{ value1: "3", value2: "1" }
                ]);
        }
        
        [Test]
		public function doesNotMatchNull():void 
		{
			assertDoesNotMatch("should not match null", 
			    sortedByFields([new SortField('value')]), 
			    null);
		}
		
		[Test]
		public function hasAReadableDescription():void 
		{
			assertDescription("an Array sorted by [\"value1\",\"value2\"]", 
			    sortedByFields([new SortField('value1'), new SortField('value2')]));			
		}
    }
}