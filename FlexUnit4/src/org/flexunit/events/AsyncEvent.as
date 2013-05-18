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
package org.flexunit.events {
	import flash.events.Event;

	/** 
	 * An AsyncEvent is fired by the AsyncHandler when an asynchronous event, registered by
	 * the TestCase, fires. The AsyncEvent contains a referenced, originalEvent, to the 
	 * originalEvent fired for future consumption. TestCase instances listen for this event
	 * on AsyncHandler instances.
	 */
	public class AsyncEvent extends Event {
		/** 
		 * A reference to the original event object fired by the developers test code. 
		 */
		public var originalEvent:Event;

		/** 
		 * Constructor.
		 * 
		 * This class has all of the properties of the event class in addition to the 
		 * originalEvent property.
		 * 
    	 * @param type The event type; indicates the action that triggered the event.
    	 *
    	 * @param bubbles Specifies whether the event can bubble
    	 * up the display list hierarchy.
    	 *
    	 * @param cancelable Specifies whether the behavior
    	 * associated with the event can be prevented.
    	 * 
		 * @param originalEvent Event that originally triggered AsyncEvent.
		 */
		public function AsyncEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, originalEvent:Event=null ) {
			this.originalEvent = originalEvent;
			super(type, bubbles, cancelable);
		}

		/** 
		 * Called by the framework to facilitate any requisite event bubbling 
		 * 
		 * @inheritDoc
		 */
		override public function clone():Event {
		   return new AsyncEvent( type, bubbles, cancelable, originalEvent );
		}
	}
}