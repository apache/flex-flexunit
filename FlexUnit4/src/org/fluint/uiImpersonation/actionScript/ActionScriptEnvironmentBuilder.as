package org.fluint.uiImpersonation.actionScript {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import org.fluint.uiImpersonation.IVisualEnvironmentBuilder;
	import org.fluint.uiImpersonation.IVisualTestEnvironment;

	/**
	 * Builds a visual test environment for ActionScript only projects 
	 * @author mlabriola
	 * 
	 */
	public class ActionScriptEnvironmentBuilder implements IVisualEnvironmentBuilder {
		/**
		 * @private 
		 */
		protected var visualDisplayRoot:DisplayObjectContainer;
		/**
		 * @private
		 */
		protected var environmentProxy:IVisualTestEnvironment;
	
		/** 
		 * Returns a reference to the single instance of the ActionScriptVisualTestEnvironment
		 * where all visual components will be created during testing.
		 * 
		 * @return A reference to the ActionScriptVisualTestEnvironment class.
		 */
		public function buildVisualTestEnvironment():IVisualTestEnvironment {
			if ( !environmentProxy ) {
				environmentProxy = new ActionScriptVisualTestEnvironment();
			}
			
			if ( visualDisplayRoot && ( environmentProxy.testEnvironment is DisplayObject ) ) {
				visualDisplayRoot.addChild( environmentProxy.testEnvironment );
			}

			return environmentProxy;			
		}
		
		/**
		 * Constructor 
		 * @param visualDisplayRoot
		 * 
		 */
		public function ActionScriptEnvironmentBuilder( visualDisplayRoot:DisplayObjectContainer ):void {
			this.visualDisplayRoot = visualDisplayRoot;
		}
	}
}