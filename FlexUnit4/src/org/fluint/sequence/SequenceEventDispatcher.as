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
package org.fluint.sequence
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/** 
	 * The sequencer event dispatcher class is used by the TestCase sequence 
	 * code to broadcast an event from a target. 
	 * 
	 * It is generally used to simulate a user gesture, such as clicking on 
	 * a button. 
	 */
	public class SequenceEventDispatcher implements ISequenceAction {
        /**
         * @private
         */
		protected var _target:IEventDispatcher;
        /**
         * @private
         */
		protected var _eventToBroadcast:Event;

		/** 
		 * The target event dispatcher where the eventToBroadcast will be 
		 * broadcast from.
		 */
		public function get target():IEventDispatcher {
			return _target;	
		}

		/** 
		 * An event object which will be broadcast on the target. 
		 */
		public function get eventToBroadcast():Event {
			return _eventToBroadcast;	
		}

		/**
		 * Dispatches the specified event on the target IEventDispatcher.
		 */
		public function execute():void {
			target.dispatchEvent( eventToBroadcast );
		}

		/** 
		 * Constructor.
		 * 
		 * @param target EventDispatcher, from which the event will be broadcast.
		 * @param eventToBrodcast An actual event, which will be broadcast from the target.
		 */
		public function SequenceEventDispatcher( target:EventDispatcher, eventToBroadcast:Event ) {
			_target = target;
			_eventToBroadcast = eventToBroadcast;
		}
	}
}