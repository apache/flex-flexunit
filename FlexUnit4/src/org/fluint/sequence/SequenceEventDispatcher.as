package org.fluint.sequence
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/** 
	 * The sequencer event dispatcher class is used by the TestCase sequence 
	 * code to broadcast an event from a target. 
	 * 
	 * It is generally used to simulate a user gesture, such as clicking on 
	 * a button. 
	 */
	public class SequenceEventDispatcher implements ISequenceAction {
        /**
         * @private
         */
		protected var _target:IEventDispatcher;
        /**
         * @private
         */
		protected var _eventToBroadcast:Event;

		/** 
		 * The target event dispatcher where the eventToBroadcast will be 
		 * broadcast from.
		 */
		public function get target():IEventDispatcher {
			return _target;	
		}

		/** 
		 * An event object which will be broadcast on the target. 
		 */
		public function get eventToBroadcast():Event {
			return _eventToBroadcast;	
		}

		/**
		 * Dispatches the specified event on the target IEventDispatcher.
		 */
		public function execute():void {
			target.dispatchEvent( eventToBroadcast );
		}

		/** 
		 * Constructor.
		 * 
		 * @param target EventDispatcher, from which the event will be broadcast.
		 * @param eventToBrodcast An actual event, which will be broadcast from the target.
		 */
		public function SequenceEventDispatcher( target:EventDispatcher, eventToBroadcast:Event ) {
			_target = target;
			_eventToBroadcast = eventToBroadcast;
		}
	}
}