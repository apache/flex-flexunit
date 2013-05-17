package org.fluint.sequence {
	import flash.events.IEventDispatcher;
	
	/**
	 * Interface describing a step in a sequence  
	 * @author mlabriola
	 * 
	 */
	public interface ISequenceStep {

		/** 
		 * The target eventDispatcher which the implementing classes will manipulate, use to boradcast events or 
		 * listen to for events
		 */
		function get target():IEventDispatcher;
	}
}