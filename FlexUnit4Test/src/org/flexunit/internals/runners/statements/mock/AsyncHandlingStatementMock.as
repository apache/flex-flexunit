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
package org.flexunit.internals.runners.statements.mock
{
	import com.anywebcam.mock.Mock;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import mx.rpc.IResponder;
	
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	import org.fluint.sequence.SequenceRunner;
	
	public class AsyncHandlingStatementMock implements IAsyncHandlingStatement
	{
		public var mock:Mock;
		
		public function get bodyExecuting():Boolean
		{
			return mock.bodyExecuting;
		}
		
		public function asyncNativeResponder( resultHandler : Function, faultHandler : Function, timeout:int, passThroughData:Object = null, timeoutHandler:Function = null ):Responder {
			return mock.asyncNativeResponder( resultHandler, faultHandler, timeout, passThroughData, timeoutHandler ) as Responder;
		}
		
		public function asyncHandler(eventHandler:Function, timeout:int, passThroughData:Object=null, timeoutHandler:Function=null):Function
		{
			return mock.asyncHandler(eventHandler, timeout, passThroughData, timeoutHandler);
		}
		
		public function asyncErrorConditionHandler(eventHandler:Function):Function
		{
			return mock.asyncErrorConditionHandler(eventHandler);
		} 
		
		CONFIG::useFlexClasses
		public function asyncResponder(responder:*, timeout:int, passThroughData:Object=null, timeoutHandler:Function=null):IResponder
		{
			return mock.asyncResponder(responder, timeout, passThroughData, timeoutHandler);
		}
		
		CONFIG::useFlexClasses
		public function handleBindableNextSequence(event:Event, sequenceRunner:SequenceRunner):void
		{
			mock.handleBindableNextSequence(event, sequenceRunner);
		}
		
		public function failOnComplete(event:Event, passThroughData:Object):void
		{
			mock.failOnComplete(event, passThroughData);
		}
		
		public function pendUntilComplete(event:Event, passThroughData:Object=null):void
		{
			mock.pendUntilComplete(event, passThroughData);
		}
		
		public function handleNextSequence(event:Event, sequenceRunner:SequenceRunner):void
		{
			mock.handleNextSequence(event, sequenceRunner);
		}
		
		public function AsyncHandlingStatementMock()
		{
			mock = new Mock(this);
		}
	}
}