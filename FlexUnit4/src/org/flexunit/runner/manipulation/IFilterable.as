package org.flexunit.runner.manipulation
{
	
	/**
	 * IRunners that allow filtering should implement this interface. Implement <code>#filter(Filter)</code>
	 * to remove tests that don't pass the filter.
	 */
	public interface IFilterable {
		
		/**
		 * Remove tests that don't pass the parameter <code>filter</code>.
		 * @param filter the <code> Filter</code> to apply
		 * @throws NoTestsRemainException if all tests are filtered out
		 */
		function filter( filter:IFilter ):void;	
	}
}