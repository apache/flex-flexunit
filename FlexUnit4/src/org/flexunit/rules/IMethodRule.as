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
package org.flexunit.rules {
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.runners.model.FrameworkMethod;

	public interface IMethodRule extends IAsyncStatement {
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
		function apply( base:IAsyncStatement, method:FrameworkMethod, test:Object ):IAsyncStatement; 
	}
}