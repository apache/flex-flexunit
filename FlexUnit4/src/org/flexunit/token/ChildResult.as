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
package org.flexunit.token {
	/**
	 * The <code>ChildResult</code> stores an <code>AsyncTestToken</code> and a potential <code>Error</code> 
	 * associated with the execution of an <code>IAsyncStatement</code>.  <code>ChildResult</code>s are created
	 * in order to provided information about the execution of one particular task to another task.<br/>
	 * 
	 * <code>ChildResult</code>s are used throughout much of FlexUnit4.  They are used to report information to
	 * <code>FlexUnitCore</code>, runners, statements, and parts of a test when a certain activity has finished.
	 */
	public class ChildResult {
		/**
		 * The <code>AsyncTestToken</code> associated with the result.
		 */
		public var token:AsyncTestToken;
		
		/**
		 * The <code>Error</code> associated with the result.
		 */
		public var error:Error;

		/**
		 * Creates a new ChildResult with the provided <code>token</code> and <code>erorr</code>.
		 * 
		 * @param token The token to associate with this result.
		 * @param error The potential <code>Error</code> that was generated from this operation.  If an
		 * <code>Error</code> was not genereated, the <code>error</code> will default to <code>null</code>.
		 */
		public function ChildResult( token:AsyncTestToken, error:Error=null ){
			this.token = token;
			this.error = error;
		}
	}
}