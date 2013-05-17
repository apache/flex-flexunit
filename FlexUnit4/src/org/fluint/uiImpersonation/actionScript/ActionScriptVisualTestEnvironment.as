package org.fluint.uiImpersonation.actionScript
{
	import flash.display.Sprite;
	
	import org.fluint.uiImpersonation.VisualTestEnvironment;
	
	/**
	 * A proxy visual test environment for ActionScript projects
	 * @author mlabriola
	 * 
	 */
	public class ActionScriptVisualTestEnvironment extends VisualTestEnvironment {
		
		/**
		 *
		 *  Constructor
		 * 
		 *
		 */
		public function ActionScriptVisualTestEnvironment() {
			super( Sprite );
		}
	}
}