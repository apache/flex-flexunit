package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   public class AssertNotNullPattern extends AbstractPattern
   {
      public function AssertNotNullPattern()
      {
         super( AssertStringFormats.NULL )
      }

      override protected function getActualResult( results : Array ) : String
      {
         return NULL;
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return NOT_NULL;
      }
   }
}
