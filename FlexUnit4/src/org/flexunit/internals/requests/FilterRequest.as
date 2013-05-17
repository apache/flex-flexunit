package org.flexunit.internals.requests {
	import org.flexunit.internals.runners.ErrorReportingRunner;
	import org.flexunit.runner.IRequest;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.Request;
	import org.flexunit.runner.manipulation.IFilter;
	import org.flexunit.runner.manipulation.NoTestsRemainException;
	import org.flexunit.runner.manipulation.filters.AbstractFilter;

	/**
	 * A <code>Request</code> that filters a test class.
	 */
	public class FilterRequest extends Request {
		/**
		 * @private
		 */
		private var request:IRequest;
		/**
		 * @private
		 */
		private var filter:IFilter;

		/**
		 * Constructor.
		 * 
		 * Creates a filtered Request.
		 * 
		 * @param classRequest An <code>IRequest</code> describing the tests.
		 * @param filter <code>Filter</code> to apply to the tests described in classRequest.
		 */
		public function FilterRequest( classRequest:IRequest, filter:IFilter ) {
			super();
			this.request = classRequest;
			this.filter = filter;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get iRunner():IRunner {
			try {
				var runner:IRunner = request.iRunner;
				filter.apply( runner );
				return runner;
			} catch ( error:NoTestsRemainException ) {
				//TODO: Need to review what exactly is needed here
				return new ErrorReportingRunner( FilterRequest, 
					new Error( "No tests found matching " + filter.describe + " from " + request ) );
								
			}
			
			return null;
		}
	}
}