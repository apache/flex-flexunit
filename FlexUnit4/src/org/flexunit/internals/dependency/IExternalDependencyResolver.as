package org.flexunit.internals.dependency {
	import flash.events.IEventDispatcher;
	
	import org.flexunit.runner.external.ExternalDependencyToken;
	
	/**
	 * IExternalDependencyResolver are responsible for resolving external dependencies on
	 * a test class
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyResolver extends IEventDispatcher {
		/**
		 * Indicates if the ExternalDependencies managed by this Resolver are
		 * all resolved.
		 *  
		 * @return true if the runner can now begin execution 
		 * 
		 */		
		function get ready():Boolean;
		/**
		 *
		 * Looks for external dependencies in the test class and begins the process of resolving them
		 *  
		 * @return true if there are external dependencies 
		 * 
		 */		
		function resolveDependencies():Boolean;
		/**
		 * Called by an ExternalDependencyToken when an IExternalDependencyLoader has completed resolving the dependency 
		 * and is ready  with data 
		 *  
		 * @param token the token keeping track of this dependency load
		 * @param data the returned data
		 * 
		 */
		function dependencyResolved( token:ExternalDependencyToken, data:Object ):void;			
		/**
		 * Called by an ExternalDependencyToken when an IExternalDependencyLoader has failed to 
		 * resolve a dependency 
		 *  
		 * @param token the token keeping track of this dependency load
		 * @param data the returned data
		 * 
		 */
		function dependencyFailed( token:ExternalDependencyToken, errorMessage:String ):void;
	}
}