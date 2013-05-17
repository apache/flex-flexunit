package org.flexunit.internals.requests
{
	import org.flexunit.runner.IRequest;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.Request;
	import org.flexunit.runner.manipulation.ISorter;
	import org.flexunit.runner.manipulation.Sorter;
	
	/**
	 * A <code>Request</code> that sorts the ordering in a test class.
	 */
	public class SortingRequest extends Request
	{
		/**
		 * @private
		 */
		private var request:IRequest;
		/**
		 * @private
		 */
		private var comparator:Function;

		/**
		 * @private
		 */
		private var sorter:ISorter;

		/**
		 * Constructor.
		 * 
		 * Creates a sorted Request.
		 * 
		 * @param request An <code>IRequest</code> describing the tests.
		 * @param sorterOrComparatorFunction is either an ISorted implementation or a comparator function to be used
		 * to define the sort order of the tests in this Request.
		 */
		public function SortingRequest(request:IRequest, sorterOrComparatorFunction:*)
		{
			super();
			this.request = request;
			
			if ( sorterOrComparatorFunction is ISorter ) {
				this.sorter = sorterOrComparatorFunction as ISorter;
			} else if ( sorterOrComparatorFunction is Function ) {
				this.comparator = sorterOrComparatorFunction as Function;
			} else {
				throw new TypeError("Provided an invalid parameter for the sorterOrComparatorFunction argument");
			}
		}
		
		//TODO: Unsure of meaning and applicability of @inheritDoc
		public override function get iRunner():IRunner {
			var runner:IRunner = request.iRunner;

			if ( sorter ) {
				sorter.apply( runner );
			} else if ( comparator != null ) {
				new Sorter(comparator).apply(runner);	
			}

			return runner;
		}

	}
}