package org.flexunit.experimental.theories
{
	/**
	 * The <code>IParameterSupplier</code> is an interface used by classes that supply values to parameters for a theory
	 * test method.
	 */
	public interface IParameterSupplier
	{
		/**
		 * Generates an Array containing all possible values that can be associated with a particular <code>sig</code> for
		 * a parameter in a theory test method.
		 * 
		 * @param sig The provided <code>ParameterSignature</code>.
		 * 
		 * @return an Array containing all possible values that can be associated with a particular <code>sig</code> for
		 * a parameter in a theory test method.
		 */
		function getValueSources( sig:ParameterSignature ):Array;	
	}
}