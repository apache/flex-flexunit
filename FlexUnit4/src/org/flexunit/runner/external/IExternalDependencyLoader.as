package org.flexunit.runner.external {
	/**
	 * Allows the user to specify a static variable of type IExternalDependencyLoader. This class
	 * is responsible for asynchronously loading and parsing any data needed for the test and 
	 * notifying the test framework on success or failure.
	 *  
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyLoader {
		/**
		 * Instructs the IExternalDependencyLoader to find and 
		 * begin resolving dependencies on this class
		 * 
		 * @param testClass
		 * @return an ExternalDependencyToken to monitor success of fault
		 * 
		 */
		function retrieveDependency( testClass:Class ):ExternalDependencyToken;
	}
}