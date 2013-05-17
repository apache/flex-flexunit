package org.flexunit.runner.manipulation
{
	
	/**
	 * Thrown when a <code>Filter</code> removes all tests from an <code>IRunner</code>.
	 */
	public class NoTestsRemainException extends Error
	{
		/**
		 * Constructor.
		 */
		public function NoTestsRemainException(message:String="", id:int=0)
		{
			super(message, id);
		}
		
	}
}