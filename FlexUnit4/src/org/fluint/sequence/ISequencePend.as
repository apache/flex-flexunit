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
	
	/**
	 * Interface defined by any step who's primary purpose is to pend 
	 * (or wait) for an action to occur before continuing the test.
	 */
	public interface ISequencePend extends ISequenceStep {
		/** 
		 * The name of the event that this step is pending upon.
		 */
		function get eventName():String;

		/** 
		 * Time in milliseconds this operation is allowed before it is considered a 
		 * failure.
		 */
		function get timeout():int;
	
		/** 
		 * Event handler to call on a timeout.
		 */
		function get timeoutHandler():Function;
		
		/** 
		 * Called to cause implementors to setup their wait conditions.
		 */
		function setupListeners( testCase:*, sequence:SequenceRunner ):void;
	}
}