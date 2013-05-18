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
package org.flexunit.internals.runners.model {
	/**
	 * The <code>MultipleFailureExecption</code> is used to store information on multiple errors
	 * that were encountered during the execution of a task.  It is used to package multiple
	 * errors into a single error, which could be stored in a <code>ChildResult</code>.  The
	 * <code>MultipleFailureExecption</code> initially takes an array of errors during
	 * instantiation; however, additional errors can be added using the <code>#addFailure()</code>
	 * method.
	 */
	public class MultipleFailureException extends Error {
		/**
		 * @private
		 */
		private var errors:Array;

/*		public function areAllErrorsType( type:Class ):Boolean {
			
			if ( !errors ) {
				return false;
			}

			var allOfType:Boolean = true;
			for ( var i:int=0; i<errors.length; i++ ) {
				allOfType &&= ( errors[ i ] is type );
				
				if ( !allOfType ) {
					break;
				}
			} 
			
			return allOfType;
		}*/
		
		/** 
		 * Returns the array of all of the failures.
		 */
		public function get failures():Array {
			return errors;
		}
		
		/** 
		 * Returns the MultipleFailureException after adding the additional failure to array of failures.
		 * 
		 * @param error The failure to add to the array of failures.
		 */
		public function addFailure( error:Error ):MultipleFailureException {
			//Create an error array if no errors were initially provided
			if ( !errors ) {
				errors = new Array();
			}

			errors.push( error );
			
			return this;
		}
		
		/** 
		 * Constructor. 
		 * 
		 * @param errors An initial array of encountered failures.
		 */
		public function MultipleFailureException( errors:Array ) {
			this.errors = errors;
			super("MultipleFailureException");
		}
		
	}
}