package org.flexunit.runner.manipulation.sortingInheritance {
	import org.flexunit.runner.IDescription;

	/**
	 * Interface for caching implementation that will allow querying of the inheritance order of a given method
	 * relative to its definition super and subclasses
	 *  
	 * @author mlabriola
	 * 
	 */	
	public interface ISortingInheritanceCache {
		/**
		 * Returns the ordering of this item with respect to its inheritance hierarchy 
		 * @param description
		 * @param superFirst
		 * @return 
		 * 
		 */		
		function getInheritedOrder( description:IDescription, superFirst:Boolean = true ):int;
	}
}