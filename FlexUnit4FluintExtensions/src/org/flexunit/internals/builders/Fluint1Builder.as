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
	
	import net.digitalprimates.fluint.tests.TestCase;
	import net.digitalprimates.fluint.tests.TestSuite;
	
	import org.flexunit.internals.runners.Fluint1ClassRunner;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>Fluint1Builder</code> potentially builds a <code>Fluint1ClassRunner</code> for
	 * a provided testClass.  It is determined whether the testClass is a Fluint suite or test case.
	 * It accomplishes this by determining whether the given testClass descends from 
	 * <code>net.digitalprimates.fluint.tests.TestCase</code> or 
	 * <code>net.digitalprimates.fluint.tests.TestSuite</code> in the Fluint (presently 1.2) library.
	 * If this is the case, a <code>Fluint1ClassRunner</code> is created for the test class; however, 
	 * if it does not fulfill this criteria, no <code>IRunner</code> will be generated.
	 */
	public class Fluint1Builder extends RunnerBuilderBase {
		
		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			var klassInfo:Klass = new Klass( testClass );
			return isFluintSuiteOrCase(klassInfo);
		}
		
		/**
		 * Returns a <code>Fluint1ClassRunner</code> if the <code>testClass</code> is a Fluint suite or test case.
		 * 
		 * @param testClass The class to check.
		 * 
		 * @return a <code>Fluint1ClassRunner</code> if the <code>testClass</code> is a Fluint suite or test case; 
		 * otherwise, a value of <code>null</code> is returned.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new Fluint1ClassRunner(testClass);
		}
		
		/**
		 * Determine if the provided <code>klassInfo</code> is a Fluint suite or test case.
		 * 
		 * @param klassInfo The klass to check.
		 * 
		 * @return a Boolean value indicating whether the <code>klassInfo</code> is a Fluint suite or test case.
		 */
		public function isFluintSuiteOrCase( klassInfo:Klass ):Boolean {
 			var testCase:Boolean = klassInfo.descendsFrom( net.digitalprimates.fluint.tests.TestCase );
			var testSuite:Boolean = klassInfo.descendsFrom( net.digitalprimates.fluint.tests.TestSuite );

			return ( testCase || testSuite );  
		}		
	}
}