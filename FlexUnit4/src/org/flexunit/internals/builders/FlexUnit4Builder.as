package org.flexunit.internals.builders
{
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.BlockFlexUnit4ClassRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>FlexUnit4Builder</code> builds a <code>BlockFlexUnit4ClassRunner</code> for
	 * a provided testClass.  A <code>BlockFlexUnit4ClassRunner</code> will be built for every
	 * testClass that is provided to this builder.<br/>
	 * 
	 * This is the last builder to be used with a testClass when determining which <code>IRunner</code>
	 * to used by the class; the <code>BlockFlexUnit4ClassRunner</code> is the default <code>IRunner</code>
	 * to use with a testClass if no other suitable runner can be found.
	 * 
	 * @see org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder#runnerForClass()
	 */
	public class FlexUnit4Builder extends RunnerBuilderBase {
		/**
		 * Constructor.
		 */
		public function FlexUnit4Builder() {
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			return true;
		}
		
		/**
		 * Returns a <code>BlockFlexUnit4ClassRunner</code> for the provided <code>testClass</code>.
		 * 
		 * @param testClass The test class provided to the builder.
		 * 
		 * @return a <code>BlockFlexUnit4ClassRunner</code> for the provided <code>testClass</code>.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new BlockFlexUnit4ClassRunner(testClass);
		}		
	}
}