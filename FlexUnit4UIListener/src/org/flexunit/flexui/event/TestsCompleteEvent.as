package org.flexunit.flexui.event
{
   import flash.events.Event;

   public class TestsCompleteEvent extends Event
   {
	  public static const TESTS_COMPLETE : String = "testsComplete";

      public function TestsCompleteEvent()
      {
         super( TESTS_COMPLETE );
      }

      public override function clone() : Event
      {
         return new TestsCompleteEvent();
      }
   }
}
