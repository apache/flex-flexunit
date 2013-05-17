package org.flexunit.runner
{
	/**
	 * Describes an <code>IDescription</code> based on its path, suite, and method
	 */
	public class Descriptor
	{
		/**
		 * @private 
		 */
		public var path:String;
		/**
		 * @private 
		 */
		public var suite:String;
		/**
		 * @private 
		 */
		public var method:String;

		/**
		 * Constructor
		 */
		public function Descriptor(path:String="", suite:String="", method:String="")
		{
			this.path = path;
			this.suite = suite;
			this.method = method;
		}
	}
}