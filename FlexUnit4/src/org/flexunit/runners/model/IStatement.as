package org.flexunit.runners.model {
	import flash.events.IEventDispatcher;
	
	
	/**
	 * Represents one or more actions to be taken at runtime in the course
	 * of running a FlexUnit test suite.
	 */
	public interface IStatement extends IEventDispatcher {
		function evaluate():void;
	}
}