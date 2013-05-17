package org.flexunit.runner.external {
	import flash.events.IEventDispatcher;
	
	import org.flexunit.internals.dependency.IExternalRunnerDependencyWatcher;
	import org.flexunit.runner.IRunner;

	/**
	 * IExternalDependencyRunner instances are IRunners which support the notion of external
	 * dependencies or data that is not present until a potentially asynchronous operation occurs
	 * 
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyRunner extends IRunner {
		/**
		 * Setter for a dependency watcher. This is a class that implements IExternalRunnerDependencyWatcher
		 * and watches for any external dependencies (such as loading data) are finalized before execution of
		 * tests is allowed to commence.  
		 * 		 
		 * @param value An implementation of IExternalRunnerDependencyWatcher
		 */

		function set dependencyWatcher( value:IExternalRunnerDependencyWatcher ):void;
		/**
		 * 
		 * Setter to indicate an error occured while attempting to load exteranl dependencies
		 * for this test. It accepts a string to allow the creator of the external dependency
		 * loader to pass a viable error string back to the user.
		 * 
		 * @param value The error message
		 * 
		 */
		function set externalDependencyError( value:String ):void;
	}
}