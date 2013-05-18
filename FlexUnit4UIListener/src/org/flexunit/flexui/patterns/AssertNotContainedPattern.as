package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   import mx.utils.StringUtil;
   
   public class AssertNotContainedPattern extends AbstractPattern
   {
      public function AssertNotContainedPattern()
      {
         super( AssertStringFormats.NOT_CONTAINED )
      }

      override protected function getActualResult( results : Array ) : String
      {
         return results[ 1 ];
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return StringUtil.substitute( SUBSTRING_OF, results[ 2 ] );
      }
   }
}
