package org.flexunit.internals.runners {
	
	/**
	 * The <code>InitializationError</code> represents one or more problems encountered while 
	 * initializing an <code>IRunner</code>.
	 */
	public class InitializationError extends Error {
		/**
		 * @private
		 */
		private var _errors:Array = new Array();;

		/**
		 * Construct a new <code>InitializationError</code> with one or more
		 * errors <code>arg</code> as causes.
		 * 
		 * @param arg The issue that cuased the <code>InitializationError</code> to occur.
		 */
		public function InitializationError( arg:* ) {
			if ( arg is Array ) {
				_errors = arg;
			} else if ( arg is String ) {
				_errors = new Array( new Error( arg ) );
			} else {
				_errors = new Array( arg );
			}
			super("InitializationError", 0);
		}

		/**
		 * Returns one or more Throwables that led to this initialization error.
		 * 
		 * @return an array contiaining the causes of the <code>InitializationError</code>.
		 */
		public function getCauses():Array {
			return _errors;
		}
	}
}