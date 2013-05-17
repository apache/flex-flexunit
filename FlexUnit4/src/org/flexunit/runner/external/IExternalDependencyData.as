package org.flexunit.runner.external {
	/**
	 * Extension to the IExternalDependencyLoader concept which allows a given class
	 * to act both as a loader and as the final data source without requiring a separate
	 * static variable. This reduces the complexity of reading the test but still allows
	 * the use of the IExternalDependencyLoader for special case situations where a static
	 * setter or related concept may have additional work to do.
	 * 
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyData extends IExternalDependencyLoader {
		/**
		 * Getter for the externally loaded data 
		 * 
		 * @return An Array of externally loaded data 
		 * 
		 */
		function get data():Array;
	}
}