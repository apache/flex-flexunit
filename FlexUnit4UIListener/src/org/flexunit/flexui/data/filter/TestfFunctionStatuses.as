package org.flexunit.flexui.data.filter
{
   public class TestfFunctionStatuses
   {
      public static const ALL : ITestFunctionStatus = new AllTestFunctionStatus();
      public static const EMPTY : ITestFunctionStatus = new EmptyTestFunctionStatus();
      public static const ERRORS_AND_FAILURES : ITestFunctionStatus = new ErrorTestFunctionStatus();
      public static const IGNORED : ITestFunctionStatus = new IgnoredTestFunctionStatus();
      
      public static function toArray() : Array
      {
         return [ ALL, ERRORS_AND_FAILURES, IGNORED ];
      }
   }
}
