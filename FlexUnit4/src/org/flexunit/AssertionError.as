package org.flexunit
{
	/**
	 * <code>Error</code> class used for failures in assertions
	 * 
	 * @see Assert
	 */
	public class AssertionError extends Error
	{
		/**
		 * Throws a new <code>Error</code> of type <code>AssertionError</code>
		 * with the passed in message
		 * 
		 * @param message The message associated with the error (<code>null</code> okay)
		 * @param id The id of the error if desired (<code>null</code> okay)
		 */
		public function AssertionError(message:String="", id:int=0)
		{
			super(message, id);
		}
		
	}
}