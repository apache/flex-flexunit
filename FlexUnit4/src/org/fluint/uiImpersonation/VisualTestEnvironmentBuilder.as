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
