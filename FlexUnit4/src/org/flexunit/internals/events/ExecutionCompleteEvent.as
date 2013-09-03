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
package org.flexunit.internals.events
{
	import flash.events.Event;
	
	/**
	 * Dispatched when the runner has finished executing tests.
	 */
	public class ExecutionCompleteEvent extends Event {
		
		public static const COMPLETE:String = "complete";
		
		/** 
		 * A potential error that was encountered during execution.
		 */
		public var error:Error;
		
		/**
		 * Constructor.
		 * 
		 * @param error A potential error that was encountered during execution.
		 */
		public function ExecutionCompleteEvent( error:Error=null  ) {
			this.error = error;
			super(COMPLETE, false, false);
		}
		
		/** 
		 * Called by the framework to facilitate any requisite event bubbling.
		 * 
		 * @inheritDoc
		 */
		override public function clone():Event {
			return new ExecutionCompleteEvent( error );
		}
	}
}