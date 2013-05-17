package org.flexunit.internals.builders
{
	import flex.lang.reflect.Klass;
	
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>IgnoredBuilder</code> potentially builds an <code>IgnoredClassRunner</code> for
	 * a provided testClass.  It is determined whether the testClass is marked as being ignored with
	 * a metadata tag ([Ignore]).  If this is the case, a <code>IgnoredClassRunner</code> is created for the test 
	 * class; however, if it does not fulfill this criteria, no <code>IRunner</code> will be generated.
	 */
	public class IgnoredBuilder extends RunnerBuilderBase {

		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			var klassInfo:Klass = new Klass( testClass );
			
			//If the klassInfo has ignore metadata, the test class should be ignored
			if ( klassInfo.hasMetaData( AnnotationConstants.IGNORE ) )
				return true;
			
			return false;
		}
		
		/**
		 * Returns a <code>IgnoredClassRunner</code> if the <code>testClass</code> has an [Ignore] metadata tag.
		 * 
		 * @param testClass The class to check.
		 * 
		 * @return a <code>IgnoredClassRunner</code> if the <code>testClass</code> has an [Ignore] metadata tag; 
		 * otherwise, a value of <code>null</code> is returned.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new IgnoredClassRunner(testClass);
		}
	}
}