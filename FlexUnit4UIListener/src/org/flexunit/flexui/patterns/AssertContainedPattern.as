package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   import mx.utils.StringUtil;
   
   public class AssertContainedPattern extends AbstractPattern
   {
      public function AssertContainedPattern()
      {
         super( AssertStringFormats.CONTAINED )
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return StringUtil.substitute( STRING_IN, results[ 2 ] );
      }
   }
}
