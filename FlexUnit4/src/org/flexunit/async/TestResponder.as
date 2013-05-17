package org.flexunit.async {
	/**
	 * A respoder for tests that contains <code>Function</code>s for the test succeeding or the test 
	 * failing to succeed.
	 */
	public class TestResponder extends Object implements ITestResponder {
		/**
		 * @private
		 */
		private var resultFunction:Function;
		/**
		 * @private
		 */
		private var faultFunction:Function;
		
		/**
		 * @inheritDoc
		 */
		public function fault( info:Object, passThroughData:Object ):void {
			faultFunction( info, passThroughData );
		}
		
		/**
		 * @inheritDoc
		 */
		public function result( data:Object, passThroughData:Object ):void {
			resultFunction( data, passThroughData );
		}
		
		/**
		 * Constructor.
		 * 
		 * @param result A <code>Function</code> that handles results and expects an info and passThroughData parameter.
		 * 
		 * <code>public function result( info:Object, passThroughData:Object ):void { ...
		 * }</code><br/>
		 * 
		 * @param fault A <code>Function</code> that handles faults and expects a data and passThroughData parameter.
		 * 
		 * <code>public function fault( data:Object, passThroughData:Object ):void { ...
		 * }</code><br/>
		 */
		public function TestResponder( result:Function, fault:Function ) {
			resultFunction = result;
			faultFunction = fault;
		}
	}
}