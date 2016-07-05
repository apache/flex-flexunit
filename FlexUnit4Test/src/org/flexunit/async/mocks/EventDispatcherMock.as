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
package org.flexunit.async.mocks
{
	import com.anywebcam.mock.Mock;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	public class EventDispatcherMock implements IEventDispatcher
	{
		public var mock:Mock;
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			mock.addzEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			mock.removezEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return mock.dispatchzEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return mock.hazEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return mock.willzTrigger(type);
		}
		
		//This property has been added for several tests
		[Bindable]
		public var testProperty:Object;
		
		public function EventDispatcherMock()
		{
			mock = new Mock(this);
		}
	}
}