package org.flexunit.runner.manipulation {
	import org.flexunit.runner.IDescription;
	
	/**
	 * Sorters should implement this interface.
	 */
	public interface ISorter {	
		/**
		 * Sorts the test in <code>runner</code> using <code>compare function</code>.
		 * 
		 * @param object
		 */
		function apply(object:Object):void;
		
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
		function compare(o1:IDescription, o2:IDescription):int;
	}
}