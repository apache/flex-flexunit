package org.flexunit.experimental.theories {
	/**
	 * The <code>IPotentialAssignment</code> interface is used by classes that want to store poential values that will
	 * be used by parameters in a theory test method.
	 */
	public interface IPotentialAssignment {
		/**
		 * Returns the value of the <code>PotentialAssignment</code>.
		 */
		function getValue():Object;
		/**
		 * Returns the name of the variable associated with the <code>PotentialAssignment</code>.
		 */
		function getDescription():String;
		/**
		 * Returns a string that includes the name of the parameter the potential assignment is associated with
		 * as well as the value being assigned to the parameter.
		 */
		function toString():String;	
	}
}