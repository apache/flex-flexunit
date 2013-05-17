package org.flexunit.runner {
	import org.flexunit.runner.manipulation.ISort;
	
	/**
	 * An <code>IRequest</code> is an abstract description of tests to be run.  It represents an object that 
	 * wraps tests when they are presented to the <code>FlexUnitCore</code>.  <code>IRequest</code>s can be 
	 * filtered and sorted to control the subset and order of tests to be executed.<br/>
	 * 
	 * The key property of the <code>IRequest</code> that the <code>FlexUnitCore</code> needs is the 
	 * <code>IRunner</code>.  The <code>IRunner</code> is an interface implemented by any object 
	 * capable of executing a specific type of test.<br/>
	 * 
	 * @see org.flexunit.runner.IRunner
	 */
	public interface IRequest {
		/**
		 * Returns that <code>ISort</code> that is being used by this <code>IRequest</code>.
		 */
		function get sort():ISort;
		function set sort( value:ISort ):void;
		
		/**
		 * Returns an <code>IRunner</code> for this <code>IRequest</code>.
		 */
		function get iRunner():IRunner;
		
		/**
		 * Creates a request that is filtered based on the provided
		 * <code>filterOrDescription</code> which is either an <code>Filter</code>
		 * or an <code>IDescription</code>.
		 * 
		 * @param filterOrDescription The <code>Filter</code> or <code>Description</code> 
		 * to apply to this <code>Request</code>.
		 * 
		 * @return a <code>Request</code> that has been filtered.
		 */
		function filterWith( filterOrDescription:* ):Request;
	}
}