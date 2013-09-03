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
package org.flexunit.internals.runners.statements {
	import org.flexunit.internals.runners.statements.AsyncStatementBase;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.token.AsyncTestToken;
	
	/**
	 * The <code>Fail</code> class is responsible for throwing a failure error when it
	 * is evaluated.  A <code>Fail</code> is often created if a critical piece of infomration
	 * is missing and another statement could not be properly generated.
	 * 
	 * @see org.flexunit.runners.BlockFlexUnit4ClassRunner
	 */
	public class Fail extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * @private
		 */
		private var error:Error;
		
		/**
		 * Constructor.
		 * 
		 * @param error The <code>Error</code> to be thrown when this statement is evalutated.
		 */
		public function Fail( error:Error ) {
			this.error = error;
		}
		
		/**
		 * Throws the error that was initially provided to <code>Fail</code>.
		 * 
		 * @param previousToken AsyncTestToken - Passed in, but not used in this method.
		 */
		public function evaluate( previousToken:AsyncTestToken ):void {
			throw error;
		}
	}
}
