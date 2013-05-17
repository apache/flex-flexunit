package org.flexunit.runner.manipulation {
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.manipulation.sortingInheritance.ISortingInheritanceCache;

	/**
	 * Implemented by sorters that also wish to customize the sorting experience
	 * for fixture elements such as Before and After
	 */	
	public interface IFixtureSorter extends ISorter {
		/**
		 * Compares its two arguments for order. Returns a negative integer, zero, or a positive integer 
		 * as the first argument is less than, equal to, or greater than the second.
		 * 
		 * @param o1 <code>IDescription</code> the first object to be compared.
		 * @param o2 <code>IDescription</code> the second object to be compared.
		 * 
		 * @return a negative integer, zero, or a positive integer 
		 * as the first argument is less than, equal to, or greater than the second.
		 * */
		function compareFixtureElements(o1:IDescription, o2:IDescription, cache:ISortingInheritanceCache, superFirst:Boolean = true):int;		
	}
}