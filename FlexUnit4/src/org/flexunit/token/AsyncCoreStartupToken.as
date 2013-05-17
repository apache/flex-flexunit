
package org.flexunit.token {
	import org.flexunit.runner.IRunner;
	
	/**
	 * The <code>AsyncCoreStartupToken</code> is used when the FlexUnit frameworks needs to wait for an
	 * asynchronous operation before it can begin test execution. The token is returned by a class needing
	 * to do the operation. The class pending can add a notificationMethod (a method to be called when the
	 * async operation is complete).
	 * 
	 * @see org.flexunit.runner.FlexUnitCore#runRunner()
	 */
	public class AsyncCoreStartupToken {
		/**
		 * @private
		 */
		private var methodsEntries:Array;
		/**
		 * @private
		 */
		private var _runner:IRunner;
		
		/**
		 * Returns an instance of the <code>IRunner</code> associated with the <code>AsyncCoreStartupToken</code>.
		 */
		public function get runner():IRunner {
			return _runner;
		}
		
		public function set runner( value:IRunner ):void {
			_runner = value;	
		}
		
		/**
		 * Adds a notification method to the <code>AsyncCoreStartupToken</code> and returns the token.
		 * 
		 * @param method A <code>Function</code> that will be invoked when the <code>AsyncCoreStartupToken</code>
		 * are ready or have completed.
		 * 
		 * @return this <code>AsyncCoreStartupToken</code> with the added <code>method</code>.
		 */
		public function addNotificationMethod( method:Function ):AsyncCoreStartupToken {
			if (methodsEntries == null)
				methodsEntries = [];
	
			methodsEntries.push( method );			

			return this;
		}
		
		/**
		 * Calls each notification method and passes the current <code>IRunner</code> to that method.
		 */
		public function sendReady():void {
			if ( methodsEntries ) {
 				for ( var i:int=0; i<methodsEntries.length; i++ ) {
					methodsEntries[ i ]( runner );
				}
 			}
		}
		
		/**
		 * Constructor.
		 */
		public function AsyncCoreStartupToken() {
		}
	}
}
