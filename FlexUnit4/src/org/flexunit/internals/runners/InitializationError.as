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
package org.flexunit.internals.runners {
	
	/**
	 * The <code>InitializationError</code> represents one or more problems encountered while 
	 * initializing an <code>IRunner</code>.
	 */
	public class InitializationError extends Error {
		/**
		 * @private
		 */
		private var _errors:Array = new Array();;

		/**
		 * Construct a new <code>InitializationError</code> with one or more
		 * errors <code>arg</code> as causes.
		 * 
		 * @param arg The issue that cuased the <code>InitializationError</code> to occur.
		 */
		public function InitializationError( arg:* ) {
			if ( arg is Array ) {
				_errors = arg;
			} else if ( arg is String ) {
				_errors = new Array( new Error( arg ) );
			} else {
				_errors = new Array( arg );
			}
			super("InitializationError", 0);
		}

		/**
		 * Returns one or more Throwables that led to this initialization error.
		 * 
		 * @return an array contiaining the causes of the <code>InitializationError</code>.
		 */
		public function getCauses():Array {
			return _errors;
		}
	}
}