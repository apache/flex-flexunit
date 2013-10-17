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
package org.fluint.sequence {
	import flash.events.IEventDispatcher;
	
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	
	/** 
	 * The sequence setter class tells the TestCase instance to pend until 
	 * the eventName occurs or the timeout expires.
	 */	 
	public class SequenceWaiter implements ISequencePend {
        /**
         * @private
         */
		protected var _target:IEventDispatcher;

        /**
         * @private
         */
		protected var _eventName:String;

        /**
         * @private
         */
		protected var _timeout:int;

        /**
         * @private
         */
		protected var _timeoutHandler:Function;

		/** 
		 * The event dispatcher where the properties/value pairs defined 
		 * in the props object will be set. 
		 */
		public function get target():IEventDispatcher {
			return _target;	
		}

		/** 
		 * Name of the event that will be broadcast by the target. 
		 * 
		 * When this event is broadcast, the TestCase sequence
		 * code moves onto the next step in the sequence. 
		 */
		public function get eventName():String {
			return _eventName;
		}

		/** 
		 * The number of milliseconds this class should wait for its handleEvent 
		 * method to be called, before firing a 'timerExpired' event. 
		 */
		public function get timeout():int {
			return _timeout;
		}

		/** 
		 * A reference to the event handler that should be called if the event named in eventName  
		 * does not fire before the timeout is reached. The handler is expected to have the follow signature:
		 * 
		 * public function handleTimeoutEvent( passThroughData:Object ):void {
		 * }
		 * 
		 * The parameter is a generic object that can optionally be provided by the developer when starting
		 * a new asynchronous operation.
		 */
		public function get timeoutHandler():Function {
			return _timeoutHandler;
		}

		/** 
		 * Called by the SequenceRunner to cause the setup of event listeners
		 **/ 
		public function setupListeners( testCase:*, sequence:SequenceRunner ):void {
			var asyncHandlingStatement:IAsyncHandlingStatement = AsyncLocator.getCallableForTest( testCase );
			target.addEventListener( eventName, asyncHandlingStatement.asyncHandler( asyncHandlingStatement.handleNextSequence, timeout, sequence, timeoutHandler ), false, 0, true );
		}
		/**
		 * Constructor.
		 *  
		 * @param target The target where properties will be set.
		 * @param eventName Event broadcast after the properties are set.
		 * @param timeout The number of milliseconds to wait before calling the timoutHandler.
		 * @param timeoutHandler Called if the timout is reached before the event is broadcast. 
		 */
		public function SequenceWaiter( target:IEventDispatcher, eventName:String, timeout:int, timeoutHandler : Function = null  ) {
			_target = target;
			_eventName = eventName;
			
			_timeoutHandler = timeoutHandler;
			_timeout = timeout;
		}
	}
}