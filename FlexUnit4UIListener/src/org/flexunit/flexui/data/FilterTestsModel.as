package org.flexunit.flexui.data
{
   import flash.events.EventDispatcher;
   
   import org.flexunit.flexui.data.filter.ITestFunctionStatus;
   import org.flexunit.flexui.event.TestRunnerBasePresentationModelProperyChangedEvent;
   
   import mx.collections.IList;

   [Event( 
      name="filterChanged", 
      type="flash.events.Event")]
   
   public class FilterTestsModel extends EventDispatcher
   {
      public var filter : String;
      
      private var _selectedTestFunctionStatus : ITestFunctionStatus;

      public function searchFilterFunc( item : Object ) : Boolean
      {
         if ( item is TestCaseData )
         {
            var testClassSum : TestCaseData = item as TestCaseData;

            testClassSum.filterText = filter;
            testClassSum.selectedTestFunctionStatus = _selectedTestFunctionStatus;
            testClassSum.refresh();

            var testCaseChildren : IList = testClassSum.children;

            if ( testCaseChildren && testCaseChildren.length > 0 )
            {
               return true;
            }
         }

         return false;
      }
      
      public function set selectedTestFunctionStatus( value : ITestFunctionStatus ) : void
      {
         _selectedTestFunctionStatus = value;
         
         dispatchEvent(
               new TestRunnerBasePresentationModelProperyChangedEvent( 
                     TestRunnerBasePresentationModelProperyChangedEvent.FILTER_CHANGED, 
                     true ) );
      }

      public function get selectedTestFunctionStatus() : ITestFunctionStatus
      {
         return _selectedTestFunctionStatus;
      }
   }
}