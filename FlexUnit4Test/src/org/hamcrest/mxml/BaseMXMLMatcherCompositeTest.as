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
package org.hamcrest.mxml
{
	import flash.events.Event;
	
	import mockolate.runner.MockolateRunner; MockolateRunner;
	import mockolate.stub;
	
	import org.flexunit.async.Async;
	import org.hamcrest.Matcher;
	import org.hamcrest.core.anything;

	[RunWith("mockolate.runner.MockolateRunner")]
	public class BaseMXMLMatcherCompositeTest
	{	
		public var matcher:BaseMXMLMatcherComposite;
		
		[Mock]
		public var child:BaseMXMLMatcher;
		
		[Before]
		public function setup():void 
		{
			matcher = new BaseMXMLMatcherCompositeForTesting();
			matcher.matcher = child;
		}
						
		[Test(async)]
		public function shouldInvalidateItselfWhenChildMatchedPropertyChanges():void 
		{
			stub(child).asEventDispatcher();
			stub(child).method("matches").args(anything()).returns(true);
			
			Async.proceedOnEvent(this, matcher, "matchedChanged");
			
			child.dispatchEvent(new Event("matchedChanged"));
		}
	}
}

import org.hamcrest.Matcher;
import org.hamcrest.core.describedAs;
import org.hamcrest.mxml.BaseMXMLMatcherComposite;

internal class BaseMXMLMatcherCompositeForTesting extends BaseMXMLMatcherComposite
{
	override protected function createMatcher():Matcher
	{
		return describedAs("BaseMXMLMatcherCompositeForTesting", matcher);
	}
}
