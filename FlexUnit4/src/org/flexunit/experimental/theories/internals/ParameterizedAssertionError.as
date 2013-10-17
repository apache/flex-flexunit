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
package org.flexunit.experimental.theories.internals {
	import org.flexunit.AssertionError;
	
	/**
	 * Thrown when an assertion is false and provides the parameters that caused the test to fail.
	 */
	public class ParameterizedAssertionError extends AssertionError {
		/**
		 * The exception that was thrown.
		 */
		public var targetException:Error;
		
		/**
		 * Constructor.
		 * 
		 * @param targetException The exception that was thrown.
		 * @param methodName The name of the method that threw the exception.
		 * @param params The parameters that were provided to the method that threw the exception.
		 */
		public function ParameterizedAssertionError( targetException:Error, methodName:String, ...params ) {
			this.targetException = targetException;
			super( methodName + " " + ( params as Array ).join( ", " ) );
			//This blows up on Mac FP10... I believe the params may be getting a this pointer causing a stack overflow.
			//For the moment, we will only pass the methodname until this is resolved 
			//super( methodName );
		}
	
//		public function equals( obj:Object ):Boolean {
//			return this.toString() == (obj.toString());
//		}
		
		/**
		 * Performs an Array join on params. Candidate for remocal in future refactor
		 * 
		 * @param delimiter
		 * @param params
		 * @return a concatenated string 
		 * 
		 */
		public static function join( delimiter:String, ...params):String {
			return ( params as Array ).join( delimiter );
		}

//TODO: Figure out when this is needed and how to distinguish from above
/*  		public static function String join(String delimiter,
				Collection<Object> values) {
			StringBuffer buffer = new StringBuffer();
			Iterator<Object> iter = values.iterator();
			while (iter.hasNext()) {
				Object next = iter.next();
				buffer.append(stringValueOf(next));
				if (iter.hasNext()) {
					buffer.append(delimiter);
				}
			}
			return buffer.toString();
		}
 */ 
 		//public function toString():String {
// 			return stringValueOf( this );
 		//}

		private static function stringValueOf( next:Object ):String {
			var result:String;
			
			try {
				result = String(next);
			} catch ( e:Error ) {
				result = "[toString failed]";
			}
			
			return result;
		}
	}
}