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
package org.flexunit.internals.requests {
	import org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder;
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.Request;
	
	use namespace classInternal;
	
	/**
	 * A <code>Request</code> that is used to determine what runner to use to run a specific test class.
	 */
	public class ClassRequest extends Request {
		/**
		 * @private
		 */
		private var testClass:Class;
		/**
		 * @private
		 */
		private var canUseSuiteMethod:Boolean;
		
		/**
		 * Constructor.
		 * 
		 * @param testClass The test class that will be used in determining the runner.
		 * @param canUseSuiteMethod A Boolean value indicating whether the user can use a <code>SuiteMethod</code>.
		 */
		public function ClassRequest( testClass:Class, canUseSuiteMethod:Boolean=true ) {
			this.testClass= testClass;
			this.canUseSuiteMethod= canUseSuiteMethod;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get iRunner():IRunner {
			return new AllDefaultPossibilitiesBuilder(canUseSuiteMethod).safeRunnerForClass(testClass);
		}
	}
}