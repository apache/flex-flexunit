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
