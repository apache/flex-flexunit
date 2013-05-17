package org.flexunit.internals.requests {
	import org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder;
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.Request;
	
	use namespace classInternal;
	
	/**
	 * A <code>Request</code> that is used to determine what runner to use to run a specific test class.
	 */
	public class ClassRequest extends Request {
		/**
		 * @private
		 */
		private var testClass:Class;
		/**
		 * @private
		 */
		private var canUseSuiteMethod:Boolean;
		
		/**
		 * Constructor.
		 * 
		 * @param testClass The test class that will be used in determining the runner.
		 * @param canUseSuiteMethod A Boolean value indicating whether the user can use a <code>SuiteMethod</code>.
		 */
		public function ClassRequest( testClass:Class, canUseSuiteMethod:Boolean=true ) {
			this.testClass= testClass;
			this.canUseSuiteMethod= canUseSuiteMethod;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get iRunner():IRunner {
			return new AllDefaultPossibilitiesBuilder(canUseSuiteMethod).safeRunnerForClass(testClass);
		}
	}
}