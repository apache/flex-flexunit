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
package org.flexunit.internals.runners {
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	
	import flexunit.framework.Test;
	
	
	/**
	 * Extends FlexUnit1ClassRunner
	 * SuiteMethod adds in the testFromSuiteMethod static class that is used to create a suite method
	 * from the passed in <code>Class</code>
	 * 
	 */
	public class SuiteMethod extends FlexUnit1ClassRunner {
		/**
		 * Constructor.
		 * 
		 * @param klass
		 */
		public function SuiteMethod( klass:Class ) {
			super( testFromSuiteMethod( klass ) );
		}
	
		/**
		 * Creates a test from a method in the suite.
		 * If there is no static suite() method, then an error is thrown.
		 * 
		 * @param clazz Class that the suite method is in.
		 * @return Test - Returns a Test 
		 * 
		 * @see flexunit.framework.Test
		 */
		public static function testFromSuiteMethod( clazz:Class ):Test {
			var suiteMethod:Method = null;
			var suite:Test = null;
			var klass:Klass = new Klass( clazz );

			try {
				suiteMethod = klass.getMethod("suite");
				if ( !suiteMethod.isStatic ) {
					throw new Error( klass.name + ".suite() must be static");
				}
				suite = Test( suiteMethod.invoke(null) );
			} catch ( e:Error ) {
				throw e;
			}
			return suite;
		}
	}
}