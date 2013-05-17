package org.flexunit.internals.runners {
	import flash.events.IEventDispatcher;
	
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.StatementSequencer;
	import org.flexunit.runner.notification.IRunNotifier;
	
	/**
	 * The <code>ChildRunnerSequencer</code> is used to sequence children of specific class.  These children are 
	 * evaluted using a function provided to the sequencer in its constructor.  These children can be provided to 
	 * the <code>ChildRunnerSequencer</code> as an array during instantiation or added using the <code>#addStep</code> 
	 * method.<br/>
	 * 
	 * The list of children can be evaluated using the <code>#evaluate</code> method and any errors encountered
	 * during execution will be noted and reported.  Each child will be run in sequence, waiting for the previous 
	 * child to finish running before starting the next.
	 * 
	 * @see org.flexunit.runners.ParentRunner
	 */
	public class ChildRunnerSequencer extends StatementSequencer implements IAsyncStatement {
		
		public static const COMPLETE:String = "complete";
		/**
		 * @private
		 */
		private var runChild:Function;
		/**
		 * @private
		 */
		private var notifier:IRunNotifier;
		/**
		 * @private
		 */
		private var parent:IEventDispatcher;
		
		/**
		 * Constructor.
		 * 
		 * @param children An <code>Array</code> of children.
		 * @param runChild A <code>Function</code> that will be run against each child.
		 * @param notifier An <code>IRunNottifer</code> that will report on a child running in the 
		 * <code>runChild</code> method.
		 */
		public function ChildRunnerSequencer( children:Array, runChild:Function, notifier:IRunNotifier ) {
			super( children );
			this.runChild = runChild;
			this.notifier = notifier;
			this.parent = parent;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function executeStep( child:* ):void {
			runChild( child, notifier, myToken );
		}
		
		/**
		 * @private
		 * @return
		 */
		override public function toString():String {
			return "ChildRunnerSequence";
		}
	}
}