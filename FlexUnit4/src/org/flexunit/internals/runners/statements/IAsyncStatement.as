package org.flexunit.internals.runners.statements {
	
	import org.flexunit.token.AsyncTestToken;
	
	/**
	 * An <code>IAsyncStatement</code> is an interface for statements that need to be evaluated and report
	 * to a parent when the statement has finish evaluating.  Often times, <code>IAsyncStatement</code> are chained together
	 * with each statement performing a specific task and notifying its parent when it has finished.
	 */
	public interface IAsyncStatement {
		/**
		 * Responisble for evaluating the current statement and reporting its completion to the provided 
		 * <code>parentToken</code>.
		 * 
		 * @param parentToken An <code>AsyncTestToken</code> that is used to notify a parent that the current 
		 * statement has finished being evalutated.
		 */
		function evaluate( parentToken:AsyncTestToken ):void;
	}
}