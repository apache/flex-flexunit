package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   public class AssertNullPattern extends AbstractPattern
   {
      public function AssertNullPattern()
      {
         super( AssertStringFormats.NOT_NULL )
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return NULL;
      }
   }
}
