/*
   Copyright (c) 2008. Adobe Systems Incorporated.
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

     * Redistributions of source code must retain the above copyright notice,
       this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution.
     * Neither the name of Adobe Systems Incorporated nor the names of its
       contributors may be used to endorse or promote products derived from this
       software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
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