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
package org.flexunit.internals.mocks
{
	import com.anywebcam.mock.Mock;
	
	import flash.events.Event;
	
	import mx.logging.ILogger;
	
	public class LoggerMock implements ILogger
	{
		public var mock:Mock;
		
		public function get category():String
		{
			return mock.category;
		}
		
		public function log(level:int, message:String, ...parameters):void
		{
			mock.invokeMethod("log", [level, message].concat(parameters));
		}
		
		public function debug(message:String, ...parameters):void
		{
			mock.invokeMethod("debug", [message].concat(parameters));
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			mock.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			mock.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return mock.dispatchEvent(event);
		}
		
		public function error(message:String, ...parameters):void
		{
			mock.invokeMethod("error", [message].concat(parameters));
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return mock.hasEventListener(type);
		}
		
		public function fatal(message:String, ...parameters):void
		{
			mock.invokeMethod("fatal", [message].concat(parameters));
		}
		
		public function willTrigger(type:String):Boolean
		{
			return mock.willTrigger(type);
		}
		
		public function info(message:String, ...parameters):void
		{
			mock.invokeMethod("info", [message].concat(parameters));
		}
		
		public function warn(message:String, ...parameters):void
		{
			mock.invokeMethod("warn", [message].concat(parameters));
		}
		
		public function LoggerMock()
		{
			mock = new Mock( this );
		}
	}
}