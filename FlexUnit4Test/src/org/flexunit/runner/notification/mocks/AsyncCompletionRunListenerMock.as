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
package org.flexunit.runner.notification.mocks
{
	import com.anywebcam.mock.Mock;
	
	import flash.events.Event;
	
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IAsyncCompletionRunListener;
	
	public class AsyncCompletionRunListenerMock implements IAsyncCompletionRunListener
	{
		public var mock:Mock;
		
		public function get complete():Boolean
		{
			return mock.complete;
		}
		
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
			return mock.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return mock.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return mock.willTrigger(type);
		}
		
		public function testRunStarted(description:IDescription):void
		{
			mock.testRunStarted(description);
		}
		
		public function testRunFinished(result:Result):void
		{
			mock.testRunFinished(result);
		}
		
		public function testStarted(description:IDescription):void
		{
			mock.testStarted(description);
		}
		
		public function testFinished(description:IDescription):void
		{
			mock.testFinished(description);
		}
		
		public function testFailure(failure:Failure):void
		{
			mock.testFailure(failure);
		}
		
		public function testAssumptionFailure(failure:Failure):void
		{
			mock.testAssumptionFailure(failure);
		}
		
		public function testIgnored(description:IDescription):void
		{
			mock.testIgnored(description);
		}
		
		public function AsyncCompletionRunListenerMock()
		{
			mock = new Mock(this);
		}
	}
}