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
package org.fluint.uiImpersonation.flex {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.getDefinitionByName;
	
	import mx.core.FlexVersion;
	import mx.managers.FocusManager;
	import mx.managers.IFocusManagerContainer;
	
	import org.fluint.uiImpersonation.IVisualEnvironmentBuilder;
	import org.fluint.uiImpersonation.IVisualTestEnvironment;

	/**
	 * Builds a visual test environment for Flex projects 
	 */
	public class FlexEnvironmentBuilder implements IVisualEnvironmentBuilder {
		/**
		 * @private 
		 */
		protected var environmentProxy:IVisualTestEnvironment;
		/**
		 * @private 
		 */
		protected var visualDisplayRoot:DisplayObjectContainer;

		/** 
		 * Returns a reference to the single instance of a Canvas or Group, depending on
		 * sdk version, where all visual components will be created during testing.
		 * 
		 * @return A reference to the Canvas or Group that serves as the display environment class.
		 */
		public function buildVisualTestEnvironment():IVisualTestEnvironment {
			
			if ( !environmentProxy ) {
				var environmentType:Class;

				/** First we are going to try to get a container for compatibility
				 *  If we cannot, then and only then, will we grab a spark group instead
				 **/
				try {
					environmentType = getDefinitionByName( "mx.core.Container" ) as Class;
					environmentProxy = new FlexMXVisualTestEnvironment( environmentType );
				} catch ( error:Error ) {
					try {
						environmentType = getDefinitionByName( "spark.components.Group" ) as Class;	
						environmentProxy = new FlexSparkVisualTestEnvironment( environmentType );
					} catch ( error:Error ) {
						environmentType = null;
					}
				}
				
				if ( !visualDisplayRoot ) {
					if ( FlexVersion.CURRENT_VERSION > FlexVersion.VERSION_3_0 ) {
						var flexGlobals:Class = Class(getDefinitionByName("mx.core::FlexGlobals"));
						visualDisplayRoot = flexGlobals.topLevelApplication.systemManager;
					} else {
						var appGlobals:Class = Class(getDefinitionByName("mx.core::ApplicationGlobals"));
						visualDisplayRoot = appGlobals.application.systemManager;
					}
				}

				if ( visualDisplayRoot && environmentProxy && ( environmentProxy.testEnvironment is DisplayObject ) ) {
					visualDisplayRoot.addChild( environmentProxy.testEnvironment );
				
					//If the SystemManager tries to remove a child bridge from the instance, from say a SWFLoader,
					//and there isn't a FocusManager, the SystemManager will throw an error.  To circumvent this,
					//we'll give the instance a valid FocusManager.
					//We need to be sure that the FocusManager is created *AFTER* adding the instance to the
					//SystemManager, because the FocusManager uses the instance's SystemManager property
					//during construction.
					if ( environmentProxy is IFocusManagerContainer ) {
						if ( !( environmentProxy as IFocusManagerContainer ).focusManager ) {
							( environmentProxy as IFocusManagerContainer ).focusManager = new FocusManager( ( environmentProxy as IFocusManagerContainer ) );
						}
					}
				}
			}
			
			return environmentProxy;
		}
		
		/**
		 * Constructor 
		 * @param visualDisplayRoot
		 * 
		 */
		public function FlexEnvironmentBuilder( visualDisplayRoot:DisplayObjectContainer ) {
			this.visualDisplayRoot = visualDisplayRoot;			
		}
	}
}