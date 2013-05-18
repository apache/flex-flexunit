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
	
	import org.flexunit.token.AsyncTestToken;
	
	/**
	 * The <code>AsyncStatementBase</code> is responsible for notifiying a parent token that a task has been completed.
	 * Many statement classes extend from this class in order to notify a parent statement that it has finished.
	 * Classes that extend from the <code>AsyncStatementBase</code> can communicate with a parent class that has provided
	 * an <code>AsyncTestToken</code> and notify the parent class when the class has finished its specific task.<br/>
	 * 
	 * A class that extends from the <code>AsyncStatementBase</code> calls the <code>#sendComplete()</code> method once
	 * a parent <code>AsyncTestToken</code> is supplied.  The parent token will then be notified of a potential error
	 * that was encountered when running the <code>AsyncStatementBase</code>.
	 */
	public class AsyncStatementBase {
		/**
		 * The <code>AsyncTestToken</code> for the parent of the current statment.  This is notified when the
		 * current statement has finished.
		 * 
		 * @see #sendComplete()
		 */
		protected var parentToken:AsyncTestToken;
		/**
		 * The <code>AsyncTestToken</code> for the current statment.
		 */
		protected var myToken:AsyncTestToken;
		/**
		 * @private
		 */
		protected var sentComplete:Boolean = false;
		
		/**
		 * Constructor.
		 */
		public function AsyncStatementBase() {
			super();
		}
		
		/**
		 * If the parentToken has not already been alerted that the statement has completed, alert the parent token that
		 * the current statement has finished.
		 * 
		 * @param error The Error to send to the parentToken.
		 */
		protected function sendComplete( error:Error = null ):void {
			//If the parentToken hasn't already be notified that the statement has completed, notify the parentToken
			if ( !sentComplete ) {
				sentComplete = true;
				parentToken.sendResult( error );
			} else {
				if ( error && error.message ) {
					trace("Token asked to send second result: " + error.message );	
				} else {
					trace("Token asked to send second result " );
				}
				
			}
			
		}
		
		/**
		 * @private 
		 * @return 
		 */
		public function toString():String {
			return "Async Statement Base";
		}
		
	}
}