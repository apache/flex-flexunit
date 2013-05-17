package org.flexunit.internals.runners.statements {
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;
	import org.flexunit.runners.model.FrameworkMethod;

	/**
	 * The <code>RunBeforesClass</code> is a <code>SequencerWithDecoration</code> for potential methods that have
	 * <code>BeforeClass</code> metadata and should be run before the test class has been created.  This class 
	 * also determines whether methods tagged as before class methods are asynchronous.
	 */
	public class RunBeforesClass extends RunBefores implements IAsyncStatement {
		
		/**
		 * @inheritDoc
		 */
		override protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			var async:Boolean = ExpectAsync.hasAsync( method, AnnotationConstants.BEFORE_CLASS );
			var needsMonitor:Boolean = false;
			//Do we already have an ExpectAsync instance for this class?
			if ( async ) {
				needsMonitor = ( !AsyncLocator.hasCallableForTest( test ) );
			}

			return ( async && needsMonitor ) ? new ExpectAsync( test, statement ) : statement;
		}
		
		/**
		 * Constructor.
		 * 
		 * @param befores An array containing all statements that need to be executed before the class is created.
		 * @param target The test class.
		 */
		public function RunBeforesClass( befores:Array, target:Object ) {
			super( befores, target );
		}

		/**
		 * @private 
		 * @return 
		 */
		override public function toString():String {
			return "RunBeforesClass";
		}
	}
}