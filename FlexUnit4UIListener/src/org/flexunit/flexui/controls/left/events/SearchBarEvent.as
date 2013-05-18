package org.flexunit.flexui.controls.left.events
{
   import flash.events.Event;

   public class SearchBarEvent extends Event
   {
      public static const FILTER_CHANGED_EVENT : String = "filterChanged";
      public static const FILTER_TEXT_CHANGED_EVENT : String = "filterTextChanged";
      public static const FILTER_RESULT_CHANGED_EVENT : String = "filterResultChanged";
      public static const FILTER_ASSERTION_CHANGED_EVENT : String = "filterAssertionChanged";
      
      public function SearchBarEvent( type : String )
      {
         super( type );
      }
   }
}
