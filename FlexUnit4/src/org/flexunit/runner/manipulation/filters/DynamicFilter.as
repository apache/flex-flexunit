package org.flexunit.runner.manipulation.filters {
	import org.flexunit.runner.IDescription;
	
	
	/**
	 * The canonical case of filtering is when you want to run a single test method in a class. Rather
	 * than introduce runner API just for that one case, FlexUnit provides a general filtering mechanism.
	 * If you want to filter the tests to be run, extend <code>Filter</code> and apply an instance of
	 * your filter to the <code>org.flexunit.runner.Request</code> before running it (see 
	 * <code>org.flexunit.runner.FlexUnitCore#run(Request)</code>. 
	 * 
	 * //TODO: IRunner is an interface, there is no pre-existing implementing class, does the following 
	 * //still apply? Is there a RunWith equivalent
	 * Alternatively, apply a <code>Filter</code> to 
	 * a org.junit.runner.Runner before running tests (for example, in conjunction with 
	 * org.junit.runner.RunWith.
	 * 
	 * @see org.flexunit.runner.FlexUnitCore#run()
	 */
	public class DynamicFilter extends AbstractFilter {
		/**
		 * @private 
		 */
		private var _shouldRunFunction:Function;
		/**
		 * @private 
		 */
		private var _describeFunction:Function;

		/**
		 * @param description the description of the test to be run
		 * @return <code>true</code> if the test should be run
		 */
		override public function shouldRun( description:IDescription ):Boolean {
			return _shouldRunFunction( description );
		}
		
		/**
		 * Returns a textual description of this Filter
		 * @return a textual description of this Filter
		 */
		override public function describe( description:IDescription ):String {
			return _describeFunction( description );			
		}

		/**
		 * Constructor 
		 * @param shouldRunFunction function that determines if a method should run
		 * @param describeFunction function that describes a method
		 * 
		 */
		public function DynamicFilter( shouldRunFunction:Function, describeFunction:Function ) {
			if ( ( shouldRunFunction == null ) || ( describeFunction == null ) ) {
				throw new TypeError("Must provide functions for comparison and description to Filter");
			}
			this._shouldRunFunction = shouldRunFunction;
			this._describeFunction = describeFunction;
		}
	}
}

