package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   public class AssertUndefinedPattern extends AbstractPattern
   {
      public function AssertUndefinedPattern()
      {
         super( AssertStringFormats.NOT_UNDEFINED )
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return UNDEFINED;
      }
   }
}
