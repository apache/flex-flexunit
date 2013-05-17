package org.flexunit.runner.notification {
	
	/**
	 * Interface to be implemented by listeners that need to perform async operations at startup
	 * that must be completed before the core can begin executing tests
	 * 
	 * @author mlabriola
	 * 
	 */
	public interface IAsyncStartupRunListener extends IAsyncRunListener {
		/**
		 * Indicates if the listener is ready for the core to begin executing tests 
		 * @return true if the listener is ready
		 * 
		 */
		function get ready():Boolean;
	}
}