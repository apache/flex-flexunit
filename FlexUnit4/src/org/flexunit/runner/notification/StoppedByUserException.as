package org.flexunit.runner.notification
{
	
	/**
	 * Thrown when a user has requested that the test run stop. Writers of 
	 * test running GUIs should be prepared to catch a <code>StoppedByUserException</code>.
	 * 
	 * @see org.flexunit.runner.notification.RunNotifier
	 */
	public class StoppedByUserException extends Error
	{
	}
}