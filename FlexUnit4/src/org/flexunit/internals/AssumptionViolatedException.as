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
package org.flexunit.internals
{
	import org.hamcrest.Description;
	import org.hamcrest.Matcher;
	import org.hamcrest.SelfDescribing;
	import org.hamcrest.StringDescription;
	
	/**
	 * The <code>AssumptionViolatedException</code> is thrown when an assumption in a test
	 * evalutes to false.  It contains information about the incorrect value that was
	 * encountered that caused the assumption to fail as well as the values that the
	 * assumption was expecting.  The <code>AssumptionViolatedException</code> is currently
	 * thrown when an assumption fails in the <code>Assume</code> class.
	 * 
	 * @see org.flexunit.Assume
	 */
	public class AssumptionViolatedException extends Error implements SelfDescribing
	{
		/**
		 * @private
		 */
		private var value:Object;
		/**
		 * @private
		 */
		private var matcher:Matcher;
		
		/**
		 * Constructor.
		 * 
		 * @param value The value that was obtained when the assumption was evaluated.
		 * @param matcher The matcher used to evaluate the assumption.
		 */
		public function AssumptionViolatedException( value:Object, matcher:Matcher=null ) {
			super(); //value instanceof Throwable ? (Throwable) value : null);
			this.value = value;
			this.matcher = matcher;
			
			//unfortunate, but best approach for now as we cannot override the message var
			this.message = getMessage();
		}
		
		/**
		 * 
		 * @return a message (String) which is a parsed string description of this class
		 * 
		 */	
		public function getMessage():String {			
			return StringDescription.toString(this);
		}

		/**
		 * Appends description based on the master
		 * 
		 * @param description
		 * 
		 */		
		public function describeTo( description:Description ):void {
			if (matcher != null) {
				description.appendText("got: ");
				description.appendValue(value);
				description.appendText(", expected: ");
				description.appendDescriptionOf(matcher);
			} else {
				description.appendText("failed assumption: " + value);
			}
		}
	}
}