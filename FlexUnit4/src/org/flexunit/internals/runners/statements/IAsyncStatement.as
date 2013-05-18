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
	 * An <code>IAsyncStatement</code> is an interface for statements that need to be evaluated and report
	 * to a parent when the statement has finish evaluating.  Often times, <code>IAsyncStatement</code> are chained together
	 * with each statement performing a specific task and notifying its parent when it has finished.
	 */
	public interface IAsyncStatement {
		/**
		 * Responisble for evaluating the current statement and reporting its completion to the provided 
		 * <code>parentToken</code>.
		 * 
		 * @param parentToken An <code>AsyncTestToken</code> that is used to notify a parent that the current 
		 * statement has finished being evalutated.
		 */
		function evaluate( parentToken:AsyncTestToken ):void;
	}
}