package org.flexunit.flexui.data.filter
{
   import org.flexunit.flexui.data.TestFunctionRowData;
   
   public interface ITestFunctionStatus
   {
      function isTestFunctionVisible( test : TestFunctionRowData ) : Boolean;
      function get label() : String;
   }
}