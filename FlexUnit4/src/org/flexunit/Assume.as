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
package org.flexunit
{
	import org.flexunit.internals.AssumptionViolatedException;
	import org.flexunit.internals.matchers.Each;
	import org.hamcrest.Matcher;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;
	
	/**
	 * A set of methods useful for stating assumptions about the conditions in which a test is meaningful.
	 * A failed assumption does not mean the code is broken, but that the test provides no useful information.
	 * The default Theories runner treats tests with failing assumptions as ignored.  Custom runners may behave differently.
	 * 
	 * For example:
	 * <pre>
	 * [Theory]
	 * public function checkBasedOnValue():void {
	 * 	var testValue:String = getValue();
	 * 	Assume.assumeNotNull(testValue);
	 * 	// ...
	 * }
	 * </pre>
	 */
	public class Assume {
		
		/**
		 * If called with an expression evaluating to <code>false</code>, the test will halt and be ignored.
		 * 
		 * @param b The evaluated Boolean value to check.
		 */
		public static function assumeTrue( b:Boolean ):void {
			assumeThat(b, equalTo(true));
		}
	
		/**
		 * If called with one or more null elements in <code>objects</code>, the test will halt and be ignored.
		 * 
		 * @param objects One or more objects to check.
		 */
		public static function assumeNotNull( ...objects):void {
			assumeThat(objects as Array, Each.eachOne(notNullValue()));
		}
	
		/**
		 * Call to assume that <code>actual</code> satisfies the condition specified by <code>matcher</code>.
		 * If not, the test halts and is ignored.
		 * 
		 * Example:
		 * <pre>
		 * Assume.assumeThat(1, is(1)); // passes
		 * foo(); // will execute
		 * Assume.assumeThat(0, is(1)); // assumption failure! test halts
		 * int x = 1 / 0; // will never execute
		 * </pre>
		 *   
		 * @param actual The computed value being compared.
		 * @param matcher An expression, built of <code>Matcher</code>s, specifying allowed values.
		 * 
		 * @see org.hamcrest.CoreMatchers
		 */
		public static function assumeThat( actual:Object, matcher:Matcher ):void {
			if (!matcher.matches(actual))
				throw new AssumptionViolatedException(actual, matcher); 
		}
	
		/**
		 * Use to assume that an operation completes normally.  If <code>e</code> is non-null, the test will halt and be ignored.
		 * 
		 * For example:
		 * <pre>
		 * [Test]
		 * public function createFileDirectory():void {
		 * 	var myFileDirectory:File = File.userDirectory.resolvePath("information");
		 * 	try {
		 * 		myFileDirectory.createDirectory();
		 * 	} catch (e:Error) {
		 * 		// stop test and ignore if data can't be opened
		 * 		Assume.assumeNoException(e);
		 * 	}
		 * 	// ...
		 * }
		 * </pre>
		 * 
		 * @param e If non-null, the offending exception.
		 */
		public static function assumeNoException( e:Error ):void {
			assumeThat(e, nullValue());
		}
	}
}