package org.flexunit.internals.runners.statements
{
	import org.flexunit.runners.model.FrameworkMethod;
	
	/**
	 * Classes that inherit <code>SequencerWithDecoration</code> are used to run methods that run either
	 * before or after a class or before or after a test.  The <code>SequencerWithDecoration</code>
	 * is provided an array of statements during instantiation.  These statements can include information that
	 * indicate that they need to be decorated.  If a  Additional tasks can be added using the 
	 * <code>#addStep</code> method before the sequence is evaluated.<br/>
	 * 
	 * The decorated statements can be executed using the <code>#evaluate</code> method and any errors encountered
	 * during execution will be noted and reported.
	 * 
	 * @see org.flexunit.internals.runners.statements.RunBefores
	 * @see org.flexunit.internals.runners.statements.RunAfters
	 */
	public class SequencerWithDecoration extends StatementSequencer
	{
		/**
		 * @private
		 */
		private var target:Object;
		
		/**
		 * Creates an <code>InvokeMethod</code> object for the given method and test class
		 * 
		 * @param method The current method to execute
		 * @param test The test class
		 */
		protected function methodInvoker( method:FrameworkMethod, test:Object ):IAsyncStatement {
			return new InvokeMethod(method, test);
		}
		
		/**
		 * Determine if a potential <code>FrameworkMethod</code> is asynchronous
		 * 
		 * @param method The <code>FrameworkMethod</code> that the statement has wrapped
		 * @param test The current test class
		 * @param statement The current statement
		 * 
		 * @return An object that implements an <code>IAsyncStatement</code> that has been decorated with a potential async
		 */
		protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			return statement;
		}
		
		/**
		 * Creates an object that implements an <code>IAsyncStatement</code> and decorates it
		 * 
		 * @param method The <code>FrameworkMethod</code> to wrap
		 * @param test The current test class
		 * 
		 * @return An object that implements an <code>IAsyncStatement</code> that has been decorated
		 */
		protected function withDecoration( method:FrameworkMethod, test:Object ):IAsyncStatement {
			var statement:IAsyncStatement = methodInvoker( method, test );
			statement = withPotentialAsync( method, test, statement );
			
			return statement;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function executeStep( child:* ):void {
			super.executeStep( child );

			var method:FrameworkMethod = child as FrameworkMethod;
			var statement:IAsyncStatement = withDecoration( method, target );

			try {
				statement.evaluate( myToken );
			} catch ( error:Error ) {
				errors.push( error );
			}
		}
		
		/**
		 * Constructor.
		 * 
		 * @param afters An array of potential statements that need to be executed at a specific time
		 * @target target The test class
		 */
		public function SequencerWithDecoration( steps:Array, target:Object ) {
			super( steps );
			this.target = target;
		}
	}
}