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
package org.flexunit.internals.builders
{
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.BlockFlexUnit4ClassRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>FlexUnit4Builder</code> builds a <code>BlockFlexUnit4ClassRunner</code> for
	 * a provided testClass.  A <code>BlockFlexUnit4ClassRunner</code> will be built for every
	 * testClass that is provided to this builder.<br/>
	 * 
	 * This is the last builder to be used with a testClass when determining which <code>IRunner</code>
	 * to used by the class; the <code>BlockFlexUnit4ClassRunner</code> is the default <code>IRunner</code>
	 * to use with a testClass if no other suitable runner can be found.
	 * 
	 * @see org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder#runnerForClass()
	 */
	public class FlexUnit4Builder extends RunnerBuilderBase {
		/**
		 * Constructor.
		 */
		public function FlexUnit4Builder() {
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			return true;
		}
		
		/**
		 * Returns a <code>BlockFlexUnit4ClassRunner</code> for the provided <code>testClass</code>.
		 * 
		 * @param testClass The test class provided to the builder.
		 * 
		 * @return a <code>BlockFlexUnit4ClassRunner</code> for the provided <code>testClass</code>.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new BlockFlexUnit4ClassRunner(testClass);
		}		
	}
}