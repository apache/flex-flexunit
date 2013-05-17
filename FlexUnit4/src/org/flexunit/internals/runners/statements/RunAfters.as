package org.flexunit.internals.runners.statements
{
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;
	import org.flexunit.runners.model.FrameworkMethod;
	
	/**
	 * The <code>RunAfters</code> is a <code>SequencerWithDecoration</code> for potential methods that have
	 * <code>After</code> metadata and should be run after a test has finished.  This class also determines
	 * whether methods tagged as after methods are asynchronous.
	 */
	public class RunAfters extends SequencerWithDecoration implements IAsyncStatement {
		
		/**
		 * @inheritDoc
		 */
		override protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			var async:Boolean = ExpectAsync.hasAsync( method, AnnotationConstants.AFTER );
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
		 * @param afters An array containing all statements that need to be executed after a test method has finished.
		 * @param target The test class.
		 */
		public function RunAfters( afters:Array, target:Object ) {
			super( afters, target );
		}

		/**
		 * @private 
		 * @return 
		 */
		override public function toString():String {
			return "RunAfters";
		}
	}
}