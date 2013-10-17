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
package org.flexunit.internals.runners.watcher {
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import org.fluint.uiImpersonation.IVisualEnvironmentBuilder;
	import org.fluint.uiImpersonation.IVisualTestEnvironment;
	import org.fluint.uiImpersonation.VisualTestEnvironmentBuilder;
	
	public class FrameWatcher {
		private static var instance:FrameWatcher;
		private var _stage:Stage;
		private var lastEnterFrameTime:Number = 0;
		
		public static const ALLOWABLE_FRAME_USE:Number = .85;
		
		//Approximate mode means that we don't have a reference to the stage so we can't observe the real
		//frame rate. So, in approximate mode, the StackAndFrameManagement code informs us of the last time it ran
		//and we use that number plus an approximation of the frame to make decisions
		private var _approximateMode:Boolean = true;
		
		private var fps:Number = 24;
		
		//Frame length is 1second (1000ms)/fps
		private var frameLength:Number = 1000/fps;
		//Use 85% of the frame
		private var maxFrameUsage:Number = frameLength * ALLOWABLE_FRAME_USE;
		
		public function get stage():Stage {
			return _stage; 
		}
		
		public function set stage( value:Stage ):void {
			
			if ( _stage ) {
				_stage.removeEventListener( Event.ENTER_FRAME, handleEnterFrame );
			}
			
			_stage = value;

			if ( _stage ) {
				fps = Math.max( stage.frameRate, 1 );
				frameLength = 1000/fps;
				maxFrameUsage = frameLength * ALLOWABLE_FRAME_USE;
				
				_approximateMode = false;
				_stage.addEventListener( Event.ENTER_FRAME, handleEnterFrame );
			} 
		}
		
		public function get approximateMode():Boolean {
			return _approximateMode; 
		}
		
		public function get timeRemaining():Boolean {
			var time:Number = ( getTimer() - lastEnterFrameTime );
			var tr:Boolean = ( time < maxFrameUsage );
			
			return tr;
		}
		
		public function simulateTick():void {
			lastEnterFrameTime = getTimer();
		}
		
		private function handleEnterFrame( event:Event ):void {
			lastEnterFrameTime = getTimer();
		}

		protected function getStage():Stage {
			/* try to get the stage through any means possible
			   Best case, someone will have given us the stage, 
			   through the VisualEnvironmentBuilder
			
			   If it wasn't specied, and we are running as Flex, that is possible, else likely not
			*/
			var testEnvironment:IVisualEnvironmentBuilder = VisualTestEnvironmentBuilder.getInstance();
			var environment:IVisualTestEnvironment = testEnvironment.buildVisualTestEnvironment();		
			
			if ( environment is DisplayObject ) {
				return ( environment as DisplayObject ).stage;
			}
			
			return null;
		}
			
		public function FrameWatcher( stage:Stage=null ) {
			if ( !stage ) {
				//If we weren't passed a stage, then try to find one
				this.stage = getStage();
			} else {
				this.stage = stage;
			}
			
		}
	}
}
