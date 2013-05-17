package org.fluint.uiImpersonation.flex {
	import org.fluint.uiImpersonation.VisualTestEnvironment;
	
	/**
	 * A visual test environment for Flex projects
	 * @author mlabriola
	 * 
	 */
	public class FlexMXVisualTestEnvironment extends VisualTestEnvironment {
		
		/**
		 * 
		 * Constructor
		 * 
		 * <p>Creates a new test environment using the <code>baseClass</code> as a base. This base
		 * needs to be a container that implements <code>IVisualElementContainer</code>. If no base class
		 * is provided, automatically uses mx.core.Container.</p>
		 * 
		 * @param baseClass A class reference to the container the environment should be built from.
		 * 
		 */
		public function FlexMXVisualTestEnvironment(baseClass:Class) {
			super( baseClass );
		}
	}
}