package org.flexunit.internals.builders {
	import flash.utils.getDefinitionByName;
	
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.IRunnerBuilder;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>AllDeafultPossibilitiesBuilder</code> is used to determine what type of <code>IRunner</code> 
	 * can be used to run a specific testClass.  The correct <code>IRunner</code> for each testClass is
	 * found using builders.  Each testClass will be compared against an array of <code>IRunnerBuilders</code>.
	 * The <code>IRunner</code> used by the testClass is the first <code>IRunner</code> that can successfully
	 * be built by one of the builders.<br/>
	 * 
	 * The order in which the builder's are checked is as follows:
	 * <ul>
	 * <li>IgnoreBuilder</li>
	 * <li>MetaDataBuilder</li>
	 * <li>SuiteMethodBuiler</li>
	 * <li>FlexUnit1Builder</li>
	 * <li>Fluint1Builder</li>
	 * <li>FlexUnit4Builder</li>
	 * </ul>
	 * 
	 * @see org.flexunit.internals.builders.IgnoreBuilder
	 * @see org.flexunit.internals.builders.MetaDataBuilder
	 * @see org.flexunit.internals.builders.SuiteMethodBuiler
	 * @see org.flexunit.internals.builders.FlexUnit1Builder
	 * @see org.flexunit.internals.builders.Fluint1Builder
	 * @see org.flexunit.internals.builders.FlexUnit4Builder
	 */
	public class AllDefaultPossibilitiesBuilder extends RunnerBuilderBase {
		/**
		 * @private
		 */
		private var canUseSuiteMethod:Boolean;
		
		/**
		 * Constructor.
		 * 
		 * @param canUseSuiteMethod A Boolean value indicating whether a <code>SuiteMethodBuilder</code> can be used.
		 */
		public function AllDefaultPossibilitiesBuilder( canUseSuiteMethod:Boolean = true ) {
			this.canUseSuiteMethod= canUseSuiteMethod;
			super();
		}
		
		/**
		 * Builds the default set of builders. This determins the order and priority of possible
		 * test runners in the system 
		 * @return An array of IRunnerBuilder objects
		 * 
		 */
		protected function buildBuilders():Array {
			return [ ignoredBuilder(),
				metaDataBuilder(),
				suiteMethodBuilder(),
				flexUnit1Builder(),
				fluint1Builder(),
				flexUnit4Builder() ];
		}

		/**
		 * Returns an <code>IRunner</code> that can be used by the provided <code>testClass</code>.  The
		 * <code>testClass</code> will be compared against builders until a suitable runner is determined.<br/>
		 * 
		 * The order in which the builder's are checked is as follows:
		 * <ul>
		 * <li>IgnoreBuilder</li>
		 * <li>MetaDataBuilder</li>
		 * <li>SuiteMethodBuiler</li>
		 * <li>FlexUnit1Builder</li>
		 * <li>Fluint1Builder</li>
		 * <li>FlexUnit4Builder</li>
		 * </ul>
		 * 
		 * @param testClass The test class that needs a runner.
		 * 
		 * @return a runner that can run the <code>testClass</code>; a value of <code>null</code> will be returned 
		 * if no suitable runner is found.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			//Construct an array of potential builders, the array is ordered so that each potential testClass
			//will check against the appropriate builder in the correct order.
			var builders:Array = buildBuilders();
			
			//Get a runner for the specific type of class
			for ( var i:int=0; i<builders.length; i++ ) {
				var builder:IRunnerBuilder = builders[ i ];
				
				if ( builder.canHandleClass( testClass ) ) {
					var runner:IRunner = builder.safeRunnerForClass( testClass );
					//A suitable runner has been found, we are done
					if (runner != null)
						return runner;
				}
			}
			return null;
		}
		
		/**
		 * Returns an <code>IgnoredBuilder</code>.
		 */
		protected function ignoredBuilder():IgnoredBuilder {
			return new IgnoredBuilder();
		}
		
		/**
		 * Returns a <code>MetaDataBuilder</code>.
		 */
		protected function metaDataBuilder():MetaDataBuilder {
			return new MetaDataBuilder(this);
		}
		
		/**
		 * If suite methods can be used, returns a <code>SuiteMethodBuilder</code>;
		 * otherwise, returns a <code>NullBuilder</code>.
		 */
		protected function suiteMethodBuilder():IRunnerBuilder {
			if (canUseSuiteMethod)
				return new SuiteMethodBuilder();

			return new NullBuilder();
		}		
		
		/**
		 * Returns a <code>FlexUnit1Builder</code>.
		 */
		protected function flexUnit1Builder():FlexUnit1Builder {
			return new FlexUnit1Builder();
		}
		
		/**
		 * If Flex classes are compiled into the swc, returns a <code>Fluint1Builder</code>;
		 * otherwise, returns a <code>NullBuilder</code>.
		 */
		protected function fluint1Builder():IRunnerBuilder {
			var runner:IRunnerBuilder;
			var builder:Class;
			
			// We have a toggle in the compiler arguments so that we can choose whether or not the flex classes should
			// be compiled into the FlexUnit swc.  For actionscript only projects we do not want to compile the
			// flex classes since it will cause errors.
			CONFIG::useFlexClasses {
				try {
					builder = getDefinitionByName( "org.flexunit.internals.builders.Fluint1Builder" ) as Class;
					runner = new builder();
				} catch ( error:Error ) {

				}
			}

			//If the runner has not be set to a Fluint1Builder, set the runner to a NullBuilder
			if ( !runner ) {
				runner = new NullBuilder();
			}
			
			return runner;
		}		
		
		/**
		 * Returns a <code>FlexUnit4Builder</code>.
		 */
		protected function flexUnit4Builder():FlexUnit4Builder {
			return new FlexUnit4Builder();
		}

	}
}