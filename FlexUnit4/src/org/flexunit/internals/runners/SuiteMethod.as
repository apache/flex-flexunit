package org.flexunit.internals.runners {
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	
	import flexunit.framework.Test;
	
	
	/**
	 * Extends FlexUnit1ClassRunner
	 * SuiteMethod adds in the testFromSuiteMethod static class that is used to create a suite method
	 * from the passed in <code>Class</code>
	 * 
	 */
	public class SuiteMethod extends FlexUnit1ClassRunner {
		/**
		 * Constructor.
		 * 
		 * @param klass
		 */
		public function SuiteMethod( klass:Class ) {
			super( testFromSuiteMethod( klass ) );
		}
	
		/**
		 * Creates a test from a method in the suite.
		 * If there is no static suite() method, then an error is thrown.
		 * 
		 * @param clazz Class that the suite method is in.
		 * @return Test - Returns a Test 
		 * 
		 * @see flexunit.framework.Test
		 */
		public static function testFromSuiteMethod( clazz:Class ):Test {
			var suiteMethod:Method = null;
			var suite:Test = null;
			var klass:Klass = new Klass( clazz );

			try {
				suiteMethod = klass.getMethod("suite");
				if ( !suiteMethod.isStatic ) {
					throw new Error( klass.name + ".suite() must be static");
				}
				suite = Test( suiteMethod.invoke(null) );
			} catch ( e:Error ) {
				throw e;
			}
			return suite;
		}
	}
}