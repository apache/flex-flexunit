package org.flexunit.runner.notification {
	
	/**
	 * An interface for listeners that may need to complete an asynchronous operation
	 * after a test run is complete and before the test runner is closed.
	 * 
	 * @author mlabriola
	 * 
	 */
	public interface IAsyncCompletionRunListener extends IAsyncRunListener {
		/**
		 * Called to determine if an IAsyncCompletionRunListener has completed all required work
		 * @return true if all work is complete 
		 * 
		 */
		function get complete():Boolean;
	}
}