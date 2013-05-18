/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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