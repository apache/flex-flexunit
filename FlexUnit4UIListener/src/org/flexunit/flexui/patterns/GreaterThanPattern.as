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
package org.flexunit.flexui.patterns
{
	import mx.utils.StringUtil;
	
	public class GreaterThanPattern extends AbstractPattern
	{
		public static const EXPECTED_START : String = "Expected:";
	public static const EXPECTED_END : String = "";
	public static const ACTUAL_START : String = "but:";
	
	public function GreaterThanPattern()
	{
		/* breaks the error based on generic hamcrest regular expression.
		All current hamcrest errors follow this format. */
		//super( /.*Expected.*\s*but: was.*/g );
		super( INEQUALITY );
	}
	
	override protected function getActualResult( results : Array ) : String
	{
		var actualResult : String = "";
		
		/* Split the message array and find where the actual result begins.
		In hamcrest errors, this is denoted by ACTUAL_START */
		var resultError : Array = results[ 0 ].split( " " ) as Array;
		var start : Number = resultError.indexOf( ACTUAL_START );
		
		/* Rebuild the error, removing all "<" and ">" from the message.
		Stop at end of line. */
		for ( var i:Number = start + 1; i < resultError.length; i++ ) {
			resultError[ i ] = resultError[ i ].toString().replace( /</g, "" );
			resultError[ i ] = resultError[ i ].toString().replace( />/g, "" );
			resultError[ i ] = resultError[ i ].toString().replace( /\(/g, "" );
			resultError[ i ] = resultError[ i ].toString().replace( /\)/g, "" );
			actualResult += StringUtil.trim( resultError[ i ].toString() ) + " ";
		}
		return StringUtil.trim( actualResult );
	}
	
	override protected function getExpectedResult( results : Array ) : String
	{
		var expectedResult : String = "";
		
		/* Split the message array and find where the expected result begins.
		In hamcrest errors, this is denoted by EXPECTED_START */
		var resultError : Array = results[ 0 ].split( " " ) as Array;
		var start : Number = resultError.indexOf( EXPECTED_START );
		
		/* Rebuild the error, removing all "<" and ">" from the message.
		Stop when EXPECTED_END is encountered in array (start of actual result) */
		for ( var i:Number = start + 1; i < resultError.length; i++ ) {
			resultError[ i ] = resultError[ i ].toString().replace( /</g, "" );
			resultError[ i ] = resultError[ i ].toString().replace( />/g, "" );
			resultError[ i ] = resultError[ i ].toString().replace( /\(/g, "" );
			resultError[ i ] = resultError[ i ].toString().replace( /\)/g, "" );
			expectedResult += StringUtil.trim( resultError[ i ].toString() ) + " ";
			
			if ( resultError[i+1] == EXPECTED_END ) {
				break;
			}
		}
		return StringUtil.trim( expectedResult );     
	}  
}
}