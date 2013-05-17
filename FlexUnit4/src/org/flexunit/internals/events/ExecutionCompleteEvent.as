package org.flexunit.internals.events
{
	import flash.events.Event;
	
	/**
	 * Dispatched when the runner has finished executing tests.
	 */
	public class ExecutionCompleteEvent extends Event {
		
		public static const COMPLETE:String = "complete";
		
		/** 
		 * A potential error that was encountered during execution.
		 */
		public var error:Error;
		
		/**
		 * Constructor.
		 * 
		 * @param error A potential error that was encountered during execution.
		 */
		public function ExecutionCompleteEvent( error:Error=null  ) {
			this.error = error;
			super(COMPLETE, false, false);
		}
		
		/** 
		 * Called by the framework to facilitate any requisite event bubbling.
		 * 
		 * @inheritDoc
		 */
		override public function clone():Event {
			return new ExecutionCompleteEvent( error );
		}
	}
}