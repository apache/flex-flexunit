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
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.experimental.theories.internals.Assignments;
	import org.flexunit.experimental.theories.internals.ParameterizedAssertionError;
	import org.flexunit.internals.AssumptionViolatedException;
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.internals.runners.model.MultipleFailureException;
	import org.flexunit.internals.runners.statements.AsyncStatementBase;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.runners.model.TestClass;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	import org.flexunit.utils.ClassNameUtil;
	
	use namespace classInternal;
	
	/**
	 * The <code>TheoryAnchor</code> is responsible for keeping track of the progress of a particular theory method.
	 * It starts the process of running the theory method for each possible combination of provided parameter, and it
	 * also is responsible for handling the overall operation of the theory.
	 */
	public class TheoryAnchor extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * @private
		 */
		private var successes:int = 0;
		/**
		 * @private
		 */
		private var frameworkMethod:FrameworkMethod;
		/**
		 * @private
		 */
		private var invalidParameters:Array = new Array();
		/**
		 * @private
		 */
		private var testClass:TestClass;
		/**
		 * @private
		 */
		private var assignment:Assignments;
		/**
		 * @private
		 */
		private var errors:Array = new Array();
		/**
		 * @private
		 */
		private var incompleteLoopCount:int = 0;
		
		/**
		 * Constructor.
		 * 
		 * @param method The theory method to run.
		 * @param testClass The test class that contains the theory to run.
		 */
 		public function TheoryAnchor( method:FrameworkMethod, testClass:TestClass ) {
			frameworkMethod = method;
			this.testClass = testClass;
			
			//Create a new token that will alert this class when the provided statement has completed
			myToken = new AsyncTestToken( ClassNameUtil.getLoggerFriendlyClassName( this ) );
			myToken.addNotificationMethod( handleMethodExecuteComplete );
		}
		
		/**
		 * Determine if any errors were thrown during execution of the theory or if the theory did not successfully run for
		 * any given data subset.
		 * 
		 * @param result The result of the executed theory.
		 */
		protected function handleMethodExecuteComplete( result:ChildResult ):void {
			var error:Error;

			if ( result && result.error ) {
				error = result.error;
			} else if ( successes == 0 ) {
				//No errors were reported, but no successes were reported either.  Inform the parent
				//that no matching conditions of any sort were found.
				error = new AssertionFailedError("Never found parameters that satisfied " + frameworkMethod.name + " method assumptions.  Violated assumptions: " + invalidParameters);
			}
			
/* 			if ( !error && ( successes == 0 ) ) {
				//We don't have any errors, but no success either, need to inform our parent
				//that we never found matching conditions of any sort
				error = new AssertionFailedError("Never found parameters that satisfied method assumptions.  Violated assumptions: " + invalidParameters);				
			} else if (  ( error ) &&
					     ( error is MultipleFailureException ) && 
						 ( MultipleFailureException( error ).areAllErrorsType( AssumptionViolatedException ) ) ) {
				//okay we have errors, but they are all assumption violations
				//If we have success, then no worries, blow this off, else, we need to report it
				if ( successes == 0 ) {
					error = new AssertionFailedError("Never found parameters that satisfied method assumptions.  Violated assumptions: " + invalidParameters);
				} else {
					//clear out these errors, they are all just assumption failures but we did have some that passed so it doesn't matter
					error = null;
				}
			} */
			
			parentToken.sendResult( error );
		}
		
		/**
		 * Determines all possible parameters that a theory could use and starts the process creating unique combinations
		 * of parameters to run in the theory.
		 * 
		 * @param parentToken The token to be notified when the test method has finished running.
		 */
		public function evaluate(parentToken:AsyncTestToken):void {
			this.parentToken = parentToken;

			//This is run once per theory method found in the class
			var assignment:Assignments = Assignments.allUnassigned( frameworkMethod.method, testClass );
			var statement:AssignmentSequencer = new AssignmentSequencer( assignment, frameworkMethod, testClass.asClass, this );
			statement.evaluate( myToken );
		}

		private function methodCompletesWithParameters( method:FrameworkMethod, complete:Assignments, freshInstance:Object ):IAsyncStatement {
			return new MethodCompleteWithParamsStatement( method, this, complete, freshInstance );
		}
		
		/**
		 * Adds a provided <code>AssumptionViolatedException</code> to an array of <code>AssumptionViolatedException</code> encountered
		 * during the course of executing the theory.
		 * 
		 * @param e The <code>AssumptionViolatedException</code> to add.
		 */
		classInternal function handleAssumptionViolation( e:AssumptionViolatedException ):void {
			invalidParameters.push(e);
		}
		
		/**
		 * Generates a <code>ParameterizedAssertionError</code> if parameters are provided; otherwise, just returns the error.
		 * 
		 * @param e The error that was thrown.
		 * @param params The parameters that were provided to the theory when the error was thrown.
		 * 
		 * @return the provided error or a <code>ParameterizedAssertionError</code> if parameters are provided.
		 */
		classInternal function reportParameterizedError( e:Error, ...params):Error {
 			if (params.length == 0)
				return e;
			return new ParameterizedAssertionError(e, frameworkMethod.name, params);
		}
		
		/**
		 * Determines whether null paramater values are acceptable for a specific theory.
		 * 
		 * @return a Boolean value indicating whether null parameter values are ok.
		 */
		classInternal function nullsOk():Boolean {
			
			return true;
			
			var isTheory:Boolean = frameworkMethod.method.hasMetaData( AnnotationConstants.THEORY );

			//this needs to be much more complicated			
			if ( isTheory ) {
				return true;
			} else {
				return false;
			}

/* 			var annotation:Theory = testMethod.method.getSpecificMetaDataArg( AnnotationConstants.THEORY );
			if (annotation == null)
				return false;
			return annotation.nullsAccepted();*/
			return false;
 		}
		
		/**
		 * Updates the number of successes for the given theory.  This should be called when the theory successfully runs for
		 * a given parameter set.
		 */
		classInternal function handleDataPointSuccess():void {
			successes++;
		}		
	}
}

