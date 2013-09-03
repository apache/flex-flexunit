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
package org.flexunit.reporting {
	import flash.utils.getQualifiedClassName;
	
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.AssertionError;
	import org.hamcrest.AssertionError;
	
	/**
	 * The <code>FailureFormatter</code> is responsible for formatting potential failures.
	 */
	public class FailureFormatter {
		
		/**
		 * Returns a Boolean indicating whether the the provided <code>error</code> is an actual failure or 
		 * if the <code>error</code> is an expected failure.
		 * 
		 * @param error The Error to check and determine if it is an actual or expected Error.
		 * 
		 * @return A Boolean value indicating whehter <code>error</code> was an actual or expected Error.
		 */
		//Determines if this is a failure or Error for reporting purposes
		//This will eventually need to be dynamic, but this will get us started
		public static function isError( error:Error ):Boolean {
			var failure:Boolean = 
			   ( ( error is org.flexunit.AssertionError ) ||
				 ( error is org.hamcrest.AssertionError ) ||
				 ( error is flexunit.framework.AssertionFailedError ) ||
				 ( getQualifiedClassName( error ) == "net.digitalprimates.fluint.assertion::AssertionFailedError" ) );

			return !failure;
		}
		
		/**
		 * Filters XML characters out of a provided <code>message</code>.
		 * 
		 * @param message The String that will have XML characters filtered out of it.
		 * 
		 * @return the <code>message</code> without XML characters.
		 */
		public static function xmlEscapeMessage( message:String ):String {
			var escape:XML = <escape/>;
			var escaped:String = '';
			var doubleQuote:RegExp = new RegExp('"', 'g'); 
			
			if ( message ) {
				//Set the children of the escape XML as the string message, and then retrieve the first item of
				//the XMLList of children and convert the XML to a string, resulting in a string without XML characters
				escape.setChildren( message );
				escaped = escape.children()[0].toXMLString();
				escaped = escaped.replace( doubleQuote, "&quot;" ); 
			}

			return escaped;
		}
		
	}
}