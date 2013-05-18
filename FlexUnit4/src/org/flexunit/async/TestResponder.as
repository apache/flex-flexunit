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
package org.flexunit.async {
	/**
	 * A respoder for tests that contains <code>Function</code>s for the test succeeding or the test 
	 * failing to succeed.
	 */
	public class TestResponder extends Object implements ITestResponder {
		/**
		 * @private
		 */
		private var resultFunction:Function;
		/**
		 * @private
		 */
		private var faultFunction:Function;
		
		/**
		 * @inheritDoc
		 */
		public function fault( info:Object, passThroughData:Object ):void {
			faultFunction( info, passThroughData );
		}
		
		/**
		 * @inheritDoc
		 */
		public function result( data:Object, passThroughData:Object ):void {
			resultFunction( data, passThroughData );
		}
		
		/**
		 * Constructor.
		 * 
		 * @param result A <code>Function</code> that handles results and expects an info and passThroughData parameter.
		 * 
		 * <code>public function result( info:Object, passThroughData:Object ):void { ...
		 * }</code><br/>
		 * 
		 * @param fault A <code>Function</code> that handles faults and expects a data and passThroughData parameter.
		 * 
		 * <code>public function fault( data:Object, passThroughData:Object ):void { ...
		 * }</code><br/>
		 */
		public function TestResponder( result:Function, fault:Function ) {
			resultFunction = result;
			faultFunction = fault;
		}
	}
}