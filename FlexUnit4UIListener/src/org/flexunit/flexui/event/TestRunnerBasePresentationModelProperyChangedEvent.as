package org.flexunit.flexui.event
{
   import flash.events.Event;

   public class TestRunnerBasePresentationModelProperyChangedEvent extends Event
   {
      public static const ROW_SELECTED_CHANGED : String = "rowSelectedChanged";
      public static const TEST_SUITE_RUN_DURATION_CHANGED : String = "testSuiteRunDurationChanged";
      public static const TOTAL_ERRORS_CHANGED : String = "totalErrorsChanged";
      public static const TOTAL_FAILURES_CHANGED : String = "totalFailuresChanged";
      public static const TOTAL_IGNORED_CHANGED : String = "totalIgnoredChanged";

      public static const PROGRESS_CHANGED : String = "progressChanged";
      public static const FILTER_CHANGED : String = "filterChanged";
      public static const FILTER_ENABLE_CHANGED : String = "filterEnableChanged";

      public function TestRunnerBasePresentationModelProperyChangedEvent( type : String, bubbles : Boolean = false )
      {
         super( type, bubbles );
      }
   }
}
