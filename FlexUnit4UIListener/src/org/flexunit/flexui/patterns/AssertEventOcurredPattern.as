package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   public class AssertEventOcurredPattern extends AbstractPattern
   {
      public function AssertEventOcurredPattern()
      {
         super( AssertStringFormats.EVENT_DID_NOT_OCCUR )
      }

      override protected function getActualResult( results : Array ) : String
      {
         return results[ 2 ];
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return results[ 1 ];
      }
   }
}
