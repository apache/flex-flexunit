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
	
	import mx.binding.utils.ChangeWatcher;
	import mx.events.PropertyChangeEvent;
	
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	
	/** 
	 * The sequence setter class tells the TestCase instance to pend until 
	 * the eventName occurs or the timeout expires.
	 */	 
	public class SequenceBindingWaiter implements ISequencePend {
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
		protected var _propertyName:String;

        /**
         * @private
         */
		protected var _timeout:int;
		
		/**
		 * @private
		 */
		protected var _cw:ChangeWatcher;

        /**
         * @private
         */
		protected var _timeoutHandler:Function;

		public function get changeWatcher():ChangeWatcher {
			return _cw;	
		}

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
		 * Name of the property that will change. 
		 * 
		 * When this property changes, the TestCase sequence
		 * code moves onto the next step in the sequence. 
		 */
		public function get propertyName():String {
			return _propertyName;
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
		 * 
		 * @throws Error Attempting to watch un-watchable property
		 **/ 
		public function setupListeners( testCase:*, sequence:SequenceRunner ):void {
			if ( ChangeWatcher.canWatch( target, propertyName ) ) {
				var asyncHandlingStatement:IAsyncHandlingStatement = AsyncLocator.getCallableForTest( testCase );
				_cw = ChangeWatcher.watch( target, propertyName, asyncHandlingStatement.asyncHandler( asyncHandlingStatement.handleBindableNextSequence, timeout, sequence, timeoutHandler ) );
			} else {
				throw new Error( "Attempting to watch un-watchable property" );
			}
			//target.addEventListener( PropertyChangeEvent.PROPERTY_CHANGE, testCase.asyncHandler( testCase.handleBindableNextSequence, timeout, sequence, timeoutHandler ), false, 0, true );
		}
		/**
		 * Constructor.
		 *  
		 * @param target The target where the property exists.
		 * @param propertyName The name of the property that will change via data binding.
		 * @param timeout The number of milliseconds to wait before calling the timoutHandler.
		 * @param timeoutHandler Called if the timout is reached before the event is broadcast. 
		 */
		public function SequenceBindingWaiter( target:IEventDispatcher, propertyName:String, timeout:int, timeoutHandler : Function = null  ) {
			_target = target;
			_propertyName = propertyName;
			_eventName = PropertyChangeEvent.PROPERTY_CHANGE;
			
			_timeoutHandler = timeoutHandler;
			_timeout = timeout;
		}
	}
}