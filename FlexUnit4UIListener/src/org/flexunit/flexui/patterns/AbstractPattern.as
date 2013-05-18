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
   import org.flexunit.flexui.data.TestFunctionRowData;

   public class AbstractPattern
   {
      public static const STRING_IN : String = "String in {0}";
      public static const STRING_MATCHING : String = "String matching {0}";
      public static const STRING_NOT_MATCHING : String = "String not matching {0}";
      public static const SUBSTRING_OF : String = "Substring of {0}";
      public static const NULL : String = "null";
      public static const NOT_NULL : String = "not null";
      public static const UNDEFINED : String = "undefined";
      public static const NOT_UNDEFINED : String = "not undefined";
      public static const CALL_BEFORE : String = "Call before {0}";
      public static const HAMCREST : RegExp = /.*Expected.*\s*but: was.*/;
	  public static const INEQUALITY : RegExp = /.*Expected:.*\s*but: .*/;

      private var _pattern : RegExp;
      private var results : Array;

	  /*  If the assertion error is a standard flexunit error, format it using the
	      constant strings.  If it is a hamcrest error, the pattern is passed and
	      may be used directly. */
      public function AbstractPattern( pattern : Object )
      { 
      	 if ( pattern is String ) {
         	_pattern = new RegExp( pattern.replace( /\{\d\}/g, "(.*)" ) );
         }
         else { // added to adjust for hamcrest patterns
         	_pattern = pattern as RegExp;
      	 }
      }

      public function match( errorMessage : String ) : Boolean
      {
         results = _pattern.exec( errorMessage ) as Array;

         return results && results.length > 0;
      }

      public function apply( newRow : TestFunctionRowData ) : void
      {
         if ( getActualResult( results ) != null )
         {
            newRow.actualResult = getActualResult( results );
         }
         if ( getExpectedResult( results ) != null )
         {
            newRow.expectedResult = getExpectedResult( results );
         }
      }

      protected function getActualResult( results : Array ) : String
      {
         return results[ 1 ];
      }

      protected function getExpectedResult( results : Array ) : String
      {
         return results[ 2 ];
      }
   }
}
