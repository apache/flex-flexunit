package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   public class AssertEqualsPattern extends AbstractPattern
   {
      public function AssertEqualsPattern()
      {
         super( AssertStringFormats.EXPECTED_BUT_WAS )
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
