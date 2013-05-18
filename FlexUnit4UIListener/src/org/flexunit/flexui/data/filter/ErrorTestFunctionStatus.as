package org.flexunit.flexui.data.filter
{
   import org.flexunit.flexui.controls.FlexUnitLabels;
   import org.flexunit.flexui.data.TestFunctionRowData;

   public class ErrorTestFunctionStatus implements ITestFunctionStatus
   {
      public function isTestFunctionVisible( test : TestFunctionRowData ) : Boolean
      {
         return test.testIsFailure;
      }
      
      public function get label() : String
      {
         return FlexUnitLabels.FAILURES_AND_ERRORS;
      }
   }
}