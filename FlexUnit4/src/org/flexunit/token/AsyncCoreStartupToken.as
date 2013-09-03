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
	import org.flexunit.runner.IRunner;
	
	/**
	 * The <code>AsyncCoreStartupToken</code> is used when the FlexUnit frameworks needs to wait for an
	 * asynchronous operation before it can begin test execution. The token is returned by a class needing
	 * to do the operation. The class pending can add a notificationMethod (a method to be called when the
	 * async operation is complete).
	 * 
	 * @see org.flexunit.runner.FlexUnitCore#runRunner()
	 */
	public class AsyncCoreStartupToken {
		/**
		 * @private
		 */
		private var methodsEntries:Array;
		/**
		 * @private
		 */
		private var _runner:IRunner;
		
		/**
		 * Returns an instance of the <code>IRunner</code> associated with the <code>AsyncCoreStartupToken</code>.
		 */
		public function get runner():IRunner {
			return _runner;
		}
		
		public function set runner( value:IRunner ):void {
			_runner = value;	
		}
		
		/**
		 * Adds a notification method to the <code>AsyncCoreStartupToken</code> and returns the token.
		 * 
		 * @param method A <code>Function</code> that will be invoked when the <code>AsyncCoreStartupToken</code>
		 * are ready or have completed.
		 * 
		 * @return this <code>AsyncCoreStartupToken</code> with the added <code>method</code>.
		 */
		public function addNotificationMethod( method:Function ):AsyncCoreStartupToken {
			if (methodsEntries == null)
				methodsEntries = [];
	
			methodsEntries.push( method );			

			return this;
		}
		
		/**
		 * Calls each notification method and passes the current <code>IRunner</code> to that method.
		 */
		public function sendReady():void {
			if ( methodsEntries ) {
 				for ( var i:int=0; i<methodsEntries.length; i++ ) {
					methodsEntries[ i ]( runner );
				}
 			}
		}
		
		/**
		 * Constructor.
		 */
		public function AsyncCoreStartupToken() {
		}
	}
}
