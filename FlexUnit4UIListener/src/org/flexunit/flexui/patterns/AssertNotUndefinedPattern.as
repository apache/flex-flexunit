package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   public class AssertNotUndefinedPattern extends AbstractPattern
   {
      public function AssertNotUndefinedPattern()
      {
         super( AssertStringFormats.UNDEFINED )
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return NOT_UNDEFINED;
      }
   }
}
