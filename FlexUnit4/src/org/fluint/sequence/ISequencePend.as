 package org.fluint.sequence {
	
	/**
	 * Interface defined by any step who's primary purpose is to pend 
	 * (or wait) for an action to occur before continuing the test.
	 */
	public interface ISequencePend extends ISequenceStep {
		/** 
		 * The name of the event that this step is pending upon.
		 */
		function get eventName():String;

		/** 
		 * Time in milliseconds this operation is allowed before it is considered a 
		 * failure.
		 */
		function get timeout():int;
	
		/** 
		 * Event handler to call on a timeout.
		 */
		function get timeoutHandler():Function;
		
		/** 
		 * Called to cause implementors to setup their wait conditions.
		 */
		function setupListeners( testCase:*, sequence:SequenceRunner ):void;
	}
}