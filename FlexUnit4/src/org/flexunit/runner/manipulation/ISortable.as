package org.flexunit.runner.manipulation
{
	/**
	 * Interface for runners that allow sorting of tests. By sorting tests based on when they last failed, 
	 * most recently failed first, you can reduce the average time to the first test failing. Test sorting 
	 * should not be used to cope with order dependencies between tests. Tests that are isolated from each 
	 * other are less expensive to maintain and can be run individually. 
	 * */
	public interface ISortable
	{
		/**
		 * Sorts the tests using <code>sorter</code>.
		 * 
		 * @param sorter The <code>Sorter</code> to use for sorting the tests.
		 */
		function sort(sorter:ISorter):void;
	}
}