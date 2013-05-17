package org.flexunit.internals.builders {
	import flex.lang.reflect.Klass;
	
	import org.flexunit.internals.runners.SuiteMethod;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>SuiteMethodBuilder</code> potentially builds a <code>SuiteMethod</code> for
	 * a provided testClass.  It is determined whether the testClass contains a suite method in 
	 * order to determine if it is a FlexUnit1 suite.  It does this by checking to see if the
	 * provided testClass contains a static suite method.  If this is the case, a 
	 * <code>SuiteMethod</code> is created for the test class; however, if it does not fulfill 
	 * this criteria, no <code>IRunner</code> will be generated.
	 */
	public class SuiteMethodBuilder extends RunnerBuilderBase {
		
		
		/**
		 * @inheritDoc
		 *  
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			return hasSuiteMethod( testClass );
		}
		
		/**
		 * Returns a <code>SuiteMethod</code> if the <code>testClass</code> has a suite method.
		 * 
		 * @param testClass The class to check.
		 * 
		 * @return a <code>SuiteMethod</code> if the <code>testClass</code> has a suite method; otherwise, a
		 * value of null is returned.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new SuiteMethod( testClass );
		}
		
		/**
		 * Determine if the provided <code>testClass</code> has a suite method.
		 * 
		 * @param testClass The class to check.
		 * 
		 * @return a Boolean value indicating whether the <code>testClass</code> has a suite method.
		 */
		public function hasSuiteMethod( testClass:Class ):Boolean {
			var klass:Klass = new Klass( testClass );
			
			if ( klass.getMethod( "suite" ) ) { 
				return true;
			}
			
			return false;
		}
	}
}