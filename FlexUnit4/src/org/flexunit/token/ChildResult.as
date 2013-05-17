package org.flexunit.token {
	/**
	 * The <code>ChildResult</code> stores an <code>AsyncTestToken</code> and a potential <code>Error</code> 
	 * associated with the execution of an <code>IAsyncStatement</code>.  <code>ChildResult</code>s are created
	 * in order to provided information about the execution of one particular task to another task.<br/>
	 * 
	 * <code>ChildResult</code>s are used throughout much of FlexUnit4.  They are used to report information to
	 * <code>FlexUnitCore</code>, runners, statements, and parts of a test when a certain activity has finished.
	 */
	public class ChildResult {
		/**
		 * The <code>AsyncTestToken</code> associated with the result.
		 */
		public var token:AsyncTestToken;
		
		/**
		 * The <code>Error</code> associated with the result.
		 */
		public var error:Error;

		/**
		 * Creates a new ChildResult with the provided <code>token</code> and <code>erorr</code>.
		 * 
		 * @param token The token to associate with this result.
		 * @param error The potential <code>Error</code> that was generated from this operation.  If an
		 * <code>Error</code> was not genereated, the <code>error</code> will default to <code>null</code>.
		 */
		public function ChildResult( token:AsyncTestToken, error:Error=null ){
			this.token = token;
			this.error = error;
		}
	}
}