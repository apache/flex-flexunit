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
package org.flexunit.runners.cases.stub {
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.MethodRuleBase;
	import org.flexunit.rules.IMethodRule;
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.ChildResult;
	
	public class SynchronousRule extends MethodRuleBase implements IMethodRule {
		override public function evaluate( parentToken:AsyncTestToken ):void {
			super.evaluate( parentToken );
			
			//Do something synchronous if you wanted to

			//Tell the framework to execute the next statement moving toward the actual test execution
			proceedToNextStatement();
		}
		
		override public function apply(base:IAsyncStatement, method:FrameworkMethod, test:Object):IAsyncStatement {
			//You have access to the method and test if you need it
			return super.apply( base, method, test );
		}
		
		override protected function handleStatementComplete( result:ChildResult ):void {
			//You can also examine the results of the other statements and change if desired... for example
			//if you were expecting an exception, you could check the result and make this test now pass if the result
			//was the correct error
			super.handleStatementComplete( result );
		}
		
		override public function toString():String {
			//Please override the toString() or debugging is... rough
			return "Synchronous Rule";
		}		
	}
}