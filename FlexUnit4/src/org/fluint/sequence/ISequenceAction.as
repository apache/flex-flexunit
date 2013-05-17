package org.fluint.sequence {
	import flash.events.IEventDispatcher;

	/** 
	 * Interface that defines the requisite methods for the sequence classes.
	 * 
	 * Any sequence can have (n) action classes.
	 */
	public interface ISequenceAction extends ISequenceStep {
		/**
		 * Called to instruct implementing object to execute its code.
		 */
		function execute():void;
	}
}