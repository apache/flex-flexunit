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
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	import org.flexunit.utils.ClassNameUtil;

	/**
	 * Base implemention class for an IMethodRule. Provides scaffolding for extension 
	 */	
	public class MethodRuleBase extends AsyncStatementBase implements IAsyncStatement {
		/**
		 * an instance variable which holds the next statement in the descending stack 
		 */
		protected var baseStatement:IAsyncStatement;

		/**
		 * Called when this rule is added to the wrapping set of statements before a test method
		 * exectuion
		 *  
		 * @param base the next statement in the descending stack
		 * @param method the method that will be tested
		 * @param test instance where that method is declared
		 * @return an IAsyncStatement
		 * 
		 */		
		public function apply(base:IAsyncStatement, method:FrameworkMethod, test:Object):IAsyncStatement {
			this.baseStatement = base;
			return this;
		}
		
		/**
		 * Called when it is time for this rule to do its job.
		 *  
		 * @param parentToken token that the rule should store and use to notify the previous
		 * statement when it is completed its work
		 * 
		 */
		public function evaluate( parentToken:AsyncTestToken ):void {
			//Store parent token
			this.parentToken = parentToken;
		}
		
		/**
		 * Convenience method for notifying the next statement that it can begin its pretest work  
		 * 
		 */		
		protected function proceedToNextStatement():void {
			baseStatement.evaluate( myToken );
		}
		
		/**
		 * called when the baseStatement has completed its post-test work. Allows this statement to
		 * do work post test
		 *  
		 * @param result the result of the base statements execution
		 * 
		 */		
		protected function handleStatementComplete( result:ChildResult ):void {
			sendComplete( result.error );
		}
		
		/**
		 * A method which must be overriden in subclasses. Crucial to debugging errant rules
		 * @return 
		 * 
		 */		
		override public function toString():String {
			return "Rule1";
		}	

		/**
		 * Constructor 
		 * 
		 */		
		public function MethodRuleBase() {
			myToken = new AsyncTestToken( ClassNameUtil.getLoggerFriendlyClassName( this ) );
			myToken.addNotificationMethod( handleStatementComplete );
		}
	}
}