package org.flexunit.internals.dependency {
	import org.flexunit.token.AsyncCoreStartupToken;

	public interface IExternalRunnerDependencyWatcher {
		/**
		 * Returns the start up <code>AsyncCoreStartupToken</code> that the FlexUnit core 
		 * uses to wait for the resolution of all dependencies
		 * 
		 */
		function get token():AsyncCoreStartupToken;		
		/**
		 * Indicates if there are still unresolved dependencies in any runner
		 *  
		 * @return true is all dependencies have been resolved
		 * 
		 */
		function get allDependenciesResolved():Boolean;
		/**
		 * Tells an implementing watcher to monitor an additional IExternalDependencyResolver
		 * 
		 * @param dr IExternalDependencyResolver
		 * 
		 */
		function watchDependencyResolver( dr:IExternalDependencyResolver ):void;
	}
}