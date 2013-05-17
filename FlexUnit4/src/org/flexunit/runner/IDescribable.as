package org.flexunit.runner {
	/**
	 * The <code>IDescribable</code> interface is to be used by classes that can produce an
	 * <code>IDescription</code> of themselves.
	 */
	public interface IDescribable {
		/**
		 * Returns an <code>IDescription</code> of the object.
		 */
		function get description():IDescription;
	}
}