package org.fluint.uiImpersonation {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import org.fluint.uiImpersonation.actionScript.ActionScriptEnvironmentBuilder;

	/** 
	 * TestEnvironment is a singleton class that allows tests to have 
	 * visual components. 
	 * 
	 * The TestCase has a series of fascade methods such as addChild() 
	 * and removeChild() which actually call those methods on this class.
	 **/
	public class VisualTestEnvironmentBuilder implements IVisualEnvironmentBuilder {
        /**
         * @private
         */
		protected static var instance:VisualTestEnvironmentBuilder; 
		/**
		 * @private
		 */
		protected var builder:IVisualEnvironmentBuilder;
		/**
		 * @private
		 */
		protected var visualDisplayRoot:DisplayObjectContainer;

		/** 
		 * Returns a reference to the single instance of this class 
		 * where all visual components will be created during testing.
		 * 
		 * @return A reference to the TestEnvironment class.
		 */
		public static function getInstance( visualDisplayRoot:DisplayObjectContainer=null ):VisualTestEnvironmentBuilder {
			if ( !instance ) {
				instance = new VisualTestEnvironmentBuilder( visualDisplayRoot );
			}
			
			return instance;
		}

		/**
		 * Builds and returns an IVisualTestEnvironment based on the selected builder
		 * 
		 * @return IVisualTestEnvironment
		 * 
		 */
		public function buildVisualTestEnvironment():IVisualTestEnvironment {
			return builder.buildVisualTestEnvironment();
		}

		/**
		 * Constructor 
		 * @param visualDisplayRoot the system manager in flex or the app in ActionScript projects
		 * 
		 */
		public function VisualTestEnvironmentBuilder( visualDisplayRoot:DisplayObjectContainer ) {
			this.visualDisplayRoot = visualDisplayRoot;

			CONFIG::useFlexClasses {
				import org.fluint.uiImpersonation.flex.FlexEnvironmentBuilder;
				
				builder = new FlexEnvironmentBuilder( visualDisplayRoot );
			}
			
			if ( !builder ) {
				builder = new ActionScriptEnvironmentBuilder( visualDisplayRoot );
			}
		}
	}
}
