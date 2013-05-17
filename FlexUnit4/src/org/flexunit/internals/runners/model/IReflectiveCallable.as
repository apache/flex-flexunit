package org.flexunit.internals.runners.model {
	
	/**
	 * When invoked, throws the exception from the reflected method, rather than
	 * wrapping it in an InvocationTargetException.
	 */
	public interface IReflectiveCallable {
		function run():Object;
	}
}