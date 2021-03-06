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
package org.flexunit.experimental.runners.statements {
	import org.flexunit.experimental.theories.internals.Assignments;
	import org.flexunit.experimental.theories.internals.error.CouldNotGenerateValueException;
	import org.flexunit.internals.AssumptionViolatedException;
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.internals.runners.statements.AsyncStatementBase;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	
	use namespace classInternal;
	
	/**
	 * The <code>MethodCompleteWithParamsStaetement</code> is responsible for executing a theory method with a single 
	 * set of parameters.
	 */
	public class MethodCompleteWithParamsStatement extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * @private
		 */
		private var frameworkMethod:FrameworkMethod;
		/**
		 * @private
		 */
		private var anchor:TheoryAnchor;
		/**
		 * @private
		 */
		private var complete:Assignments;
		/**
		 * @private
		 */
		private var freshInstance:Object;
		
		/**
		 * Constructor.
		 * 
		 * @param frameworkMethod The current theory that is being tested.
		 * @param anchor The anchor for the current theory that is being tested.
		 * @param complete Contains values that can be applied to the theory method.
		 * @param freshInstance An instance of the current test class.
		 */
		public function MethodCompleteWithParamsStatement( frameworkMethod:FrameworkMethod, anchor:TheoryAnchor, complete:Assignments, freshInstance:Object ) {
			this.frameworkMethod = frameworkMethod;
			this.complete = complete;
			this.freshInstance = freshInstance;
			this.anchor = anchor;
			
			//Create a new token that will alert this class when the provided statement has completed
			myToken = new AsyncTestToken( "MethodCompleteWithParamsStatement" );
			myToken.addNotificationMethod( handleChildExecuteComplete );
		}	
		
		/**
		 * Executes the current theory method with the provided values from the complete <code>Assignments</code>.
		 * 
		 * @param parentToken The token to be notified when the theory method has finished running.
		 */
		public function evaluate( parentToken:AsyncTestToken ):void {
			this.parentToken = parentToken;	
	
	 		try {
				var values:Object = complete.getMethodArguments( anchor.nullsOk() );
				frameworkMethod.applyExplosively( freshInstance, values as Array );
				myToken.sendResult();
			} catch ( e:CouldNotGenerateValueException ) {
				sendComplete( null );	
			} catch ( e:AssumptionViolatedException ) {
				anchor.handleAssumptionViolation( e );
				sendComplete( e );	
			} catch ( e:Error ) {
				//trace( e.getStackTrace() );
				//TODO: Trace from this point forward to determine why stack overflow is happening in ParameterizedAssertionError
				var newError:Error = anchor.reportParameterizedError(e, complete.getArgumentStrings(anchor.nullsOk()));
				sendComplete( newError );			
			}
	 	}
		
		/**
		 * Tells the parent token that the method has finished running and provides it with any encountered errors.
		 * 
		 * @param result A <code>ChildResult</code> that contains potential errors encountered during execution.
		 */
		public function handleChildExecuteComplete( result:ChildResult ):void {
			sendComplete( result.error );
		}
		
		/**
		 * Returns a string that includes the name of the method, the assigned parameters, and the 
		 * new instance of the current test class.
		 */
		override public function toString():String {
			var statementString:String = "MethodCompleteWithParamsStatement :\n";
	
			statementString += "          Method : "+frameworkMethod.method.name + "\n";		
			statementString += "          Complete :\n"+complete + "\n";		
			statementString += "          Instance : "+freshInstance;		
			
			return statementString;
		}
		
	}
}