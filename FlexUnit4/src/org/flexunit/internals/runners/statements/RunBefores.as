package org.flexunit.internals.runners.statements {
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;
	import org.flexunit.runners.model.FrameworkMethod;
	
	/**
	 * The <code>RunBefores</code> is a <code>SequencerWithDecoration</code> for potential methods that have
	 * <code>Before</code> metadata and should be run before a test has started.  This class also determines
	 * whether methods tagged as before methods are asynchronous.
	 */
	public class RunBefores extends SequencerWithDecoration implements IAsyncStatement {
		
		/**
		 * @inheritDoc
		 */
		override protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			var async:Boolean = ExpectAsync.hasAsync( method, AnnotationConstants.BEFORE );

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
		 * @param befores An array containing all statements that need to be executed before a test is executed.
		 * @param target The test class.
		 */
		public function RunBefores( befores:Array, target:Object, statement:IAsyncStatement=null ) {
			super( befores, target );
		}

		/**
		 * @private 
		 * @return 
		 */
		override public function toString():String {
			return "RunBefores";
		}
	}
}