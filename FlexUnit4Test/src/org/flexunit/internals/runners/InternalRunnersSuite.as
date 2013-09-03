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
package org.flexunit.internals.runners
{
	import org.flexunit.internals.runners.cases.ChildRunnerSequencerCase;
	import org.flexunit.internals.runners.cases.ErrorReportingRunnerCase;
	import org.flexunit.internals.runners.cases.InitializationErrorCase;
	import org.flexunit.internals.runners.model.InternalRunnersModelSuite;
	import org.flexunit.internals.runners.statements.InternalRunnersStatmentsSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class InternalRunnersSuite
	{
		//Cases
		public var childRunnerSequencerCase:ChildRunnerSequencerCase;
		public var errorReportingRunnerCase:ErrorReportingRunnerCase;
		public var initializationErrorCase:InitializationErrorCase;
		
		//Suites
		public var internalRunnersModelSuite:InternalRunnersModelSuite;
		public var internalRunnersStatementSuite:InternalRunnersStatmentsSuite;
		
	}
}