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
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;
	import org.flexunit.runners.model.FrameworkMethod;

	/**
	 * The <code>RunBeforesClass</code> is a <code>SequencerWithDecoration</code> for potential methods that have
	 * <code>BeforeClass</code> metadata and should be run before the test class has been created.  This class 
	 * also determines whether methods tagged as before class methods are asynchronous.
	 */
	public class RunBeforesClass extends RunBefores implements IAsyncStatement {
		
		/**
		 * @inheritDoc
		 */
		override protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			var async:Boolean = ExpectAsync.hasAsync( method, AnnotationConstants.BEFORE_CLASS );
			var needsMonitor:Boolean = false;
			//Do we already have an ExpectAsync instance for this class?
			if ( async ) {
				needsMonitor = ( !AsyncLocator.hasCallableForTest( test ) );
			}

			return ( async && needsMonitor ) ? new ExpectAsync( test, statement ) : statement;
		}
		
		/**
		 * Constructor.
		 * 
		 * @param befores An array containing all statements that need to be executed before the class is created.
		 * @param target The test class.
		 */
		public function RunBeforesClass( befores:Array, target:Object ) {
			super( befores, target );
		}

		/**
		 * @private 
		 * @return 
		 */
		override public function toString():String {
			return "RunBeforesClass";
		}
	}
}