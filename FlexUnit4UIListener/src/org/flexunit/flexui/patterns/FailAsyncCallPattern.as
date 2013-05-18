package org.flexunit.flexui.patterns
{
   import flexunit.framework.AssertStringFormats;
   
   import mx.utils.StringUtil;
   
   public class FailAsyncCallPattern extends AbstractPattern
   {
      public function FailAsyncCallPattern()
      {
         super( AssertStringFormats.ASYNC_CALL_NOT_FIRED );
      }

      override protected function getActualResult( results : Array ) : String
      {
         return null;
      }

      override protected function getExpectedResult( results : Array ) : String
      {
         return StringUtil.substitute( CALL_BEFORE, results[ 1 ] );
      }
   }
}
