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
package org.flexunit.internals.matchers
{
	import org.hamcrest.Matcher;

	/**
	 * Implements an EachMatcher for internal framework use 
	 * @author mlabriola
	 * 
	 */	
	public class Each {
		/**
		 * an each matcher 
		 * @param individual Matcher
		 * @return Matcher
		 * 
		 */		
		public static function eachOne( individual:Matcher ):Matcher {
			return new EachMatcher( individual );
		}	
	}
}

import org.hamcrest.BaseMatcher;
import org.hamcrest.Matcher;
import org.hamcrest.Description;
import org.hamcrest.core.not;
import org.hamcrest.collection.hasItem;

/**
 * Internal implementation of each matcher 
 * @author mlabriola
 * 
 */
class EachMatcher extends BaseMatcher {

	/**
	 * @private
	 */
	private var allItemsAre:Matcher;
	/**
	 * @private
	 */
	private var individual:Matcher;

	/**
	 * Constructor
	 */
	public function EachMatcher( individual:Matcher ):void {
		this.individual = individual;
		allItemsAre = not(hasItem(not(individual)));
	}
	
	/**
	 * @private
	 */
    override public function matches(item:Object):Boolean {
      return allItemsAre.matches( item );
    }

	/**
	 * @private
	 */
    override public function describeTo(description:Description):void {
		description.appendText("each ");
		individual.describeTo(description);	      
    }
}