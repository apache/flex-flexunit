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
	import flex.lang.reflect.Klass;
	
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.experimental.theories.internals.Assignments;
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.internals.runners.statements.ExpectAsync;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.runners.BlockFlexUnit4ClassRunner;
	import org.flexunit.runners.model.FrameworkMethod;
	
	use namespace classInternal;
	
	/**
	 * The <code>TheoryBlockRunner</code> is a runner used for running an indiviudal theory method that 
	 * has had all of its parameters assigned values.  Like the <code>BlockFlexUnit4ClassRunner</code> 
	 * from which it extends, the <code>TheoryBlockRunner</code> is based on <code>Statement</code>s.
	 */
	public class TheoryBlockRunner extends BlockFlexUnit4ClassRunner {
		/**
		 * @private
		 */
		private var complete:Assignments;
		/**
		 * @private
		 */
		private var anchor:TheoryAnchor;
		/**
		 * @private
		 */
		private var klassInfo:Klass;
		
		/**
		 * Constructor.
		 * 
		 * @param klass The class that contains the theory.
		 * @param anchor The anchor associated with the theory method.
		 * @param complete Contains the parameters used for the theory method.
		 */
		public function TheoryBlockRunner( klass:Class, anchor:TheoryAnchor, complete:Assignments ) {
			super(klass);
			this.anchor = anchor;
			this.complete = complete;
			this.klassInfo = new Klass( klass );
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function collectInitializationErrors( errors:Array ):void {
			// do nothing
		}		
		
		/**
		 * Creates a <code>MethodCompleteWithParamsStatement</code> that is used to execute the theory method for
		 * a specific set of <code>Assignments</code>.
		 * 
		 * @inheritDoc
		 */
		override protected function methodInvoker( method:FrameworkMethod, test:Object ):IAsyncStatement {
			return new MethodCompleteWithParamsStatement( method, anchor, complete, test );
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function createTest():Object {
			return klassInfo.constructor.newInstanceApply( complete.getConstructorArguments( anchor.nullsOk() ) );
		}
		
		/**
		 * Retrieves an object that implements a <code>IAsyncStatement</code> for a specific theory test method that will run
		 * a theory with a subset of potential parameters that the theory can be run with.
		 * 
		 * @param method The <code>FrameworkMethod</code> theory to test.
		 * 
		 * @return an object that implements a <code>IAsyncStatement</code> for a specific theory test.
		 */
		public function getMethodBlock( method:FrameworkMethod ):IAsyncStatement {
			return methodBlock( method );
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function methodBlock( method:FrameworkMethod ):IAsyncStatement {
			var statement:IAsyncStatement = super.methodBlock( method );
			return new TheoryBlockRunnerStatement( statement, anchor, complete ); 
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			var async:Boolean = ExpectAsync.hasAsync( method, AnnotationConstants.THEORY );
			return async ? new ExpectAsync( test, statement ) : statement;
		}
	}
}