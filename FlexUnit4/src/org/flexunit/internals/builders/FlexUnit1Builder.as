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
package org.flexunit.internals.builders {
	import flash.utils.*;
	
	import flex.lang.reflect.Klass;
	
	import flexunit.framework.TestCase;
	
	import org.flexunit.internals.runners.FlexUnit1ClassRunner;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>FlexUnit1Builder</code> potentially builds a <code>FlexUnit1ClassRunner</code> for
	 * a provided testClass.  It is determined whether the testClass descends from a FlexUnit1 
	 * <code>flexunit.framework.TestCase</code> in the FlexUnit .9 library.  If it does, a 
	 * <code>FlexUnit1ClassRunner</code> is created for the test class; however, if it does not fulfill 
	 * this criteria, no <code>IRunner</code> will be generated.
	 */
	public class FlexUnit1Builder extends RunnerBuilderBase {
		
		
		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			var klassInfo:Klass = new Klass( testClass );
			
			return isPre4Test(klassInfo);
		}
		
		/**
		 * Returns a <code>FlexUnit1ClassRunner</code> if the <code>testClass</code> is a FlexUnit 1 test class.
		 * 
		 * @param testClass The class to run.
		 * 
		 * @return a <code>FlexUnit1ClassRunner</code> if the class is a test class is a FlexUnit 1 test; should
		 * only be called once you know the class is a FlexUnit1 test.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new FlexUnit1ClassRunner(testClass);
		}
		
		/**
		 * Determine if the provided <code>klassInfo</code> is a test class prior to FlexUnit4.
		 * 
		 * @param klassInfo The klass to check.
		 * 
		 * @return a Boolean value indicating whether the <code>klassInfo</code> is a test class prior to FlexUnit4.
		 */
		public function isPre4Test( klassInfo:Klass ):Boolean {
			return klassInfo.descendsFrom( flexunit.framework.TestCase );
		}		
	}
}