package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   import mx.utils.StringUtil;
   
   public class AssertMatchPattern extends AbstractPattern
   {
      public function AssertMatchPattern()
      {
         super( AssertStringFormats.NO_MATCH )
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return StringUtil.substitute( STRING_MATCHING, results[ 2 ] );
      }
   }
}
