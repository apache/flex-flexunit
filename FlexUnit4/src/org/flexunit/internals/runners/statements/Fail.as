package org.flexunit.internals.runners.statements {
	import org.flexunit.internals.runners.statements.AsyncStatementBase;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.token.AsyncTestToken;
	
	/**
	 * The <code>Fail</code> class is responsible for throwing a failure error when it
	 * is evaluated.  A <code>Fail</code> is often created if a critical piece of infomration
	 * is missing and another statement could not be properly generated.
	 * 
	 * @see org.flexunit.runners.BlockFlexUnit4ClassRunner
	 */
	public class Fail extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * @private
		 */
		private var error:Error;
		
		/**
		 * Constructor.
		 * 
		 * @param error The <code>Error</code> to be thrown when this statement is evalutated.
		 */
		public function Fail( error:Error ) {
			this.error = error;
		}
		
		/**
		 * Throws the error that was initially provided to <code>Fail</code>.
		 * 
		 * @param previousToken AsyncTestToken - Passed in, but not used in this method.
		 */
		public function evaluate( previousToken:AsyncTestToken ):void {
			throw error;
		}
	}
}
