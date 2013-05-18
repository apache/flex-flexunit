package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   import mx.utils.StringUtil;
   
   public class AssertNoMatchPattern extends AbstractPattern
   {
      public function AssertNoMatchPattern()
      {
         super( AssertStringFormats.MATCH )
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return StringUtil.substitute( STRING_NOT_MATCHING, results[ 2 ] );
      }

      override protected function getActualResult( results : Array ) : String
      {
         return StringUtil.substitute( STRING_MATCHING, results[ 2 ] );
      }
   }
}
