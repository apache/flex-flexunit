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
package org.flexunit.internals.events.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.events.ExecutionCompleteEvent;

	public class ExecutionCompleteEventCase
	{
		//TODO: Verify this test case is being handled correctly
		protected var executionCompleteEvent:ExecutionCompleteEvent;
		
		protected var error:Error;
		
		[Before(description="Creates an ExecutionCompleteEvent")]
		public function createExecutionCompleteEvent():void {
			error = new Error("error");
				
			executionCompleteEvent = new ExecutionCompleteEvent(error);
		}
		
		[After(description="Destroy the reference to the ExecutionCompleteEvent")]
		public function destroyExecutionCompleteEvent():void {
			error = null;
			executionCompleteEvent = null;
		}
		
		[Test(description="Ensure the ExecutionCompleteEvent is successfully created")]
		public function createExecutionCompleteEventTest():void {
			Assert.assertEquals(error, executionCompleteEvent.error);
		}
		
		[Test(description="Ensure the ExecutionCompleteEvent is successfully cloned")]
		public function cloneExecutionCompleteEventTest():void {
			var newExecutionCompleteEvent:ExecutionCompleteEvent = executionCompleteEvent.clone() as ExecutionCompleteEvent;
			
			Assert.assertEquals(error, newExecutionCompleteEvent.error);
		}
	}
}