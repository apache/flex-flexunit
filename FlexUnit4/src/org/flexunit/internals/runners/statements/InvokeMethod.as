package org.flexunit.internals.runners.statements {
	import org.flexunit.internals.runners.statements.AsyncStatementBase;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	import org.flexunit.utils.ClassNameUtil;
	
	/**
	 * The <code>InvokeMethod</code> is responsible for invoking a specific test method in 
	 * given test class. This class will cause the test to run and will report whether the
	 * test successfully passed with no encountered exceptions or if it exceptions were 
	 * thrown during test execution.
	 */
	public class InvokeMethod extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * @private
		 */
		private var testMethod:FrameworkMethod;
		/**
		 * @private
		 */
		private var target:Object;
		
		/**
		 * Constructor.
		 * 
		 * @param testMethod A specific method in the <code>target</code> to test.
		 * @param target The test class.
		 */
		public function InvokeMethod( testMethod:FrameworkMethod, target:Object ) {
			this.testMethod = testMethod;
			this.target = target;
		}
		
		/**
		 * Executes the test method to be run.
		 * 
		 * @param parentToken The token to be notified when the test method has finished running.
		 */
		public function evaluate( parentToken:AsyncTestToken ):void {
			
			//Invoke the test method
			try {
				testMethod.invokeExplosively( target );
				parentToken.sendResult( null );
			} catch ( error:Error ) {
				parentToken.sendResult( error );
			}
		}
		
		/**
		 * @private
		 * @return
		 */
		override public function toString():String {
			return "InvokeMethod " + testMethod.name;
		}
 	}
}
