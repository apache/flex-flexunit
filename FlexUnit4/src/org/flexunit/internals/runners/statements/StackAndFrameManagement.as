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

package org.flexunit.internals.runners.statements {
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import mx.core.Application;
	
	import org.flexunit.internals.runners.watcher.FrameWatcher;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	import org.flexunit.utils.ClassNameUtil;
	
	/**
	 * The <code>StackAndFrameManagement</code> decorator implements green threading to deal with flash 
	 * frames. This class allows us to break execution across frames and ensure a stack overflow does not 
	 * occur. It does this by starting a timer when it is asked to evaluate itself. When the timer fires, 
	 * which will be the following frame, execution will resume.<br/>
	 * 
	 * Each time we get to the beginning of a new test, we calculate the elapsed time versus the framerate.
	 * If we get to the point where we have used mroe than about 80% of a given frame, we then defer until the
	 * next one. This prevents the player from being locked into a single frame for the entire duration of the 
	 * tests preventing it from communicating with external servers, updating the UI and potentially timing out 
	 * after 15 seconds.
	 **/
	public class StackAndFrameManagement implements IAsyncStatement {
		/**
		 * @private
		 */
		protected var parentToken:AsyncTestToken;
		/**
		 * @private
		 */
		protected var myToken:AsyncTestToken;
		/**
		 * @private
		 */
		protected var timer:Timer;
		/**
		 * @private
		 */
		protected var statement:IAsyncStatement;
		
		/**
		 * @private
		 */
		private static var frameWatcher:FrameWatcher;
  		
		/**
		 * Constructor.
		 * 
		 * @param statement The current object that implements the <code>IAsyncStatement</code> to decorate.
		 */
		public function StackAndFrameManagement( statement:IAsyncStatement ) {
			super();
			
			this.statement = statement;
			
			//Create a new token that will track the progress of frame management
			myToken = new AsyncTestToken( ClassNameUtil.getLoggerFriendlyClassName( this ) );
			myToken.addNotificationMethod( handleNextExecuteComplete );
			
			if ( !frameWatcher ) {
				frameWatcher = new FrameWatcher();
			}
		}
		
		/**
		 * Determines if there is time in the frame to start running the <code>IAsyncStatement</code>.  If there is still time,
		 * the <code>IAsyncStatement</code> will be evaluated; otherwise, a timer will be started that will wait until the
		 * next frame before the <code>IAsyncStatement</code> is evaluated.
		 * 
		 * @param previousToken The token to be notified when that <code>IAsyncStatement</code> has finished executing.
		 */
		public function evaluate( previousToken:AsyncTestToken ):void {
			parentToken = previousToken;
			
			//this algorithm is still imperfect. Right now, it waits an extra frame after async tests because they always effectively
			//took more than a frame, so we need to make this a bit better. Eventually we may need a component that actaully watches
			//the frames directly to make better choices
			if ( !frameWatcher.timeRemaining ) {
				//If we have been going for more than an allowable amount of the framelength, it is time to give
				//the player a chance to catch up 
				//This timer must *NOT* have a weak reference. Sometimes things run fast enough
				//that this class will be eligible for garbage collection in between the frames
				//which causes the tests to cease, keeping this strong prevents collection until
				//we are ready
				timer = new Timer( 5, 1 );
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, handleTimerComplete, false, 0, false );
				timer.start();
				
				//This is not nearly as good as using the stage's enter frame event, but if we have no other choice, then simulate the click 
				if ( frameWatcher.approximateMode ) {
					frameWatcher.simulateTick();
				}
			} else {
				//trace("Evaluate");
				statement.evaluate( myToken );	
			}
		}
		
		/**
		 * Evaluates the <code>IAsyncStatement</code> after the timer has waited and the player is
		 * now in the next frame.
		 * 
		 * @param event
		 */
		protected function handleTimerComplete( event:TimerEvent ):void {
			timer.removeEventListener( TimerEvent.TIMER_COMPLETE, handleTimerComplete, false );
			statement.evaluate( myToken );
		}
		
		/**
		 * Report any errors the <code>ChildResult</code> has encountered to the parentToken, notifying
		 * the parentToken that we are done.
		 * 
		 * @param result The <code>ChildResult</code> to check to see if there is an error.
		 */
		public function handleNextExecuteComplete( result:ChildResult ):void {
			parentToken.sendResult( result.error );
		}

		/**
		 * @private 
		 * @return
		 */
		public function toString():String {
			return "Stack Management Base";
		}
	}
}
