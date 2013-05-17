package org.flexunit.async {
	/**
	 * An <code>ITestResponder</code> is an interface for to be implemented by classes that want to handle the results
	 * of running a test.
	 */
	public interface ITestResponder {
		/**
		 * This method is called by TestCase when an error has been received.
		 * 
		 * @param info An Object containing information about why the fault occured
		 * @param passThroughData An Object containing data that is to be passed to the fault handler function
		 **/
		function fault( info:Object, passThroughData:Object ):void 

		/**
		 * This method is called by TestCase when the return value has been received.
		 * 
		 * @param info An Object containing information about the result
		 * @param passThroughData An Object containing data that is to be passed to the result handler function
		 **/
		function result( data:Object, passThroughData:Object ):void 
	}
}