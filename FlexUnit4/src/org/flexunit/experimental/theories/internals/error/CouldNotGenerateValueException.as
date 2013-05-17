package org.flexunit.experimental.theories.internals.error
{
	/**
	 * Thrown when a value could not be generated.
	 */
	public class CouldNotGenerateValueException extends Error
	{
		/**
		 * Constructor.
		 * 
		 * @param message The message associated with the <code>CouldNotGenerateValueException</code> error.
		 * @param id The reference number associated with the specific <code>CouldNotGenerateValueException</code> error.
		 */
		public function CouldNotGenerateValueException(message:String="", id:int=0)
		{
			super(message, id);
		}
		
	}
}