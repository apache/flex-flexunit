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
package org.flexunit.experimental.runners.statements
{
	import org.flexunit.experimental.theories.internals.Assignments;
	import org.flexunit.internals.AssumptionViolatedException;
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.internals.runners.statements.AsyncStatementBase;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	
	/**
	 * The <code>TheoryBlockRunnerStatement</code> is responsible for reporting whether the theory 
	 * method with specific arguments was successful.
	 */
	public class TheoryBlockRunnerStatement extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * @private
		 */
		use namespace classInternal;
	
		/**
		 * @private
		 */
		private var statement:IAsyncStatement;
		/**
		 * @private
		 */
		private var anchor:TheoryAnchor;
		/**
		 * @private
		 */
		private var complete:Assignments;
		
		/**
		 * Constructor.
		 * 
		 * @param statement The <code>IAsyncStatement</code> to execute.
		 * @param anchor The anchor associated with the theory method.
		 * @param complete The <code>Assignments</code> associated with the current theory method test.
		 */
		public function TheoryBlockRunnerStatement( statement:IAsyncStatement, anchor:TheoryAnchor, complete:Assignments ) {
			this.statement = statement;
			this.anchor = anchor;
			this.complete = complete;
			
			//Create a new token that will alert this class when the provided statement has completed
			myToken = new AsyncTestToken( "TheoryBlockRunnerStatement" );
			myToken.addNotificationMethod( handleChildExecuteComplete );
		}	
		
		/**
		 * Executes the current <code>IAsyncStatement</code> that is wrapping the theory method test.
		 * 
		 * @param parentToken The token to be notified when the the current theory method test has finished all other statements.
		 */
		public function evaluate( parentToken:AsyncTestToken ):void {
			this.parentToken = parentToken;
	
	 		try {
	 			//trace( statement );
				statement.evaluate( myToken );				
			} catch ( e:AssumptionViolatedException ) {
				anchor.handleAssumptionViolation( e );
				sendComplete( e );	
			} catch ( e:Error ) {
				trace( e.getStackTrace() );
				anchor.reportParameterizedError(e, complete.getArgumentStrings(anchor.nullsOk()));
				//sendComplete( e );			
			}
		}
		
		/**
		 * Notifies the anchor if the statement successfully executed and the parent token of any errors that were encountered
		 * while running the theory method test.
		 * 
		 * @param result A <code>ChildResult</code> that contains potential errors encountered during the statements execution.
		 */
		public function handleChildExecuteComplete( result:ChildResult ):void {
			var assumptionError:Boolean = false;

			if ( result && result.error && result.error is AssumptionViolatedException) {
				assumptionError = true;
			}  
			
			//If no assumption errors were encountered when running the current theory method test, notify the anchor that one
			//set of data points were successful
			if ( !assumptionError ) {
				anchor.handleDataPointSuccess();
			}

			sendComplete( result.error );
		}
	}

}