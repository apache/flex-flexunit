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
package org.flexunit.runner.notification {
	import flash.system.Capabilities;
	
	import org.flexunit.runner.IDescription;
	
	/**
	 * A <code>Failure</code> holds a description of the failed test and the
	 * exception that was thrown while running it. In most cases the 
	 * <code>org.flexunit.runner.Description</code> will be of a single test.  However,
	 * if problems are encountered while constructing the test (for example, if a 
	 * Before method is static), it may describe something other than a single test.
	 */
	public class Failure {
		/**
		 * @private
		 */
		private var _description:IDescription;
		/**
		 * @private
		 */
		private var _exception:Error;

		/**
		 * Constructor.
		 * 
		 * Constructs a <code>Failure</code> with the given description and exception.
		 * 
		 * @param description An <code>IDescription</code> of the test that failed.
		 * @param exception The exception that was thrown while running the test.
		 */
		public function Failure( description:IDescription, exception:Error ) {
			this._description = description;
			this._exception = exception;
		}
		
		/**
		 * @return a user-understandable label for the test.
		 */
		public function get testHeader():String {
			return description.displayName;
		}
	
		/**
		 * @return the raw description of the context of the failure.
		 */
		public function get description():IDescription {
			return _description;
		}
	
		/**
		 * @return the exception thrown.
		 */
	
		public function get exception():Error {
		    return _exception;
		}
		
		/**
		 * @private
		 * @return
		 */
		public function toString():String {
			var str:String = testHeader + ": " + message;
		    return str;
		}
	
		/**
		 * Convenience method.
		 * 
		 * @return the printed form of the exception.
		 */
		public function get stackTrace():String {
			if ( Capabilities.isDebugger )
			{
				return exception.getStackTrace();
			}
			else
			{
				return '';
			}
		}
	
		/**
		 * Convenience method.
		 * 
		 * @return the message of the thrown exception.
		 */
		public function get message():String {
			return exception.message;
		}
		
	}
}