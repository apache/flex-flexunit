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
package org.flexunit.internals.runners.statements
{
	import org.flexunit.internals.runners.statements.cases.AsyncStatementBaseCase;
	import org.flexunit.internals.runners.statements.cases.ExpectAsyncASCase;
	import org.flexunit.internals.runners.statements.cases.ExpectExceptionCase;
	import org.flexunit.internals.runners.statements.cases.FailCase;
	import org.flexunit.internals.runners.statements.cases.FailOnTimeoutCase;
	import org.flexunit.internals.runners.statements.cases.InvokeMethodCase;
	import org.flexunit.internals.runners.statements.cases.RunAftersCase;
	import org.flexunit.internals.runners.statements.cases.RunAftersClassCase;
	import org.flexunit.internals.runners.statements.cases.RunBeforesCase;
	import org.flexunit.internals.runners.statements.cases.RunBeforesClassCase;
	import org.flexunit.internals.runners.statements.cases.SequencerWithDecorationCase;
	import org.flexunit.internals.runners.statements.cases.StackAndFrameManagementCase;
	import org.flexunit.internals.runners.statements.cases.StatementSequencerCase;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class InternalRunnersStatmentsSuite
	{
		public var asyncStatementBaseCase:AsyncStatementBaseCase;
		public var expectAsyncCase:ExpectAsyncASCase;
		public var expectExceptionCase:ExpectExceptionCase;
		public var failCase:FailCase;
		public var failOnTimeoutCase:FailOnTimeoutCase;
		public var invokeMethodCase:InvokeMethodCase;
		public var runAftersCase:RunAftersCase;
		public var runAftersClassCase:RunAftersClassCase;
		public var runBeforesCase:RunBeforesCase;
		public var runBeforesClassCase:RunBeforesClassCase;
		public var sequencerWithDecorationCase:SequencerWithDecorationCase;
		public var statckAndFrameManagmentCase:StackAndFrameManagementCase;
		public var statementSequencerCase:StatementSequencerCase;
	}
}