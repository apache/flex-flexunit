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
	 * An <code>ITestResponder</code> is an interface for to be implemented by classes that want to handle the results
	 * of running a test.
	 */
	public interface ITestResponder {
		/**
		 * This method is called by TestCase when an error has been received.
		 * 
		 * @param info An Object containing information about why the fault occured
		 * @param passThroughData An Object containing data that is to be passed to the fault handler function
		 **/
		function fault( info:Object, passThroughData:Object ):void 

		/**
		 * This method is called by TestCase when the return value has been received.
		 * 
		 * @param info An Object containing information about the result
		 * @param passThroughData An Object containing data that is to be passed to the result handler function
		 **/
		function result( data:Object, passThroughData:Object ):void 
	}
}