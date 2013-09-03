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
package tests.flex.lang.reflect.constructor {
	import flex.lang.reflect.Constructor;
	import flex.lang.reflect.Klass;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	
	import tests.flex.lang.reflect.constructor.helper.Constructor0ArgTestClass;
	import tests.flex.lang.reflect.constructor.helper.Constructor1ArgTestClass;
	import tests.flex.lang.reflect.constructor.helper.Constructor2ArgTestClass;
	import tests.flex.lang.reflect.constructor.helper.Constructor3ArgTestClass;
	import tests.flex.lang.reflect.constructor.helper.ConstructorUndefinedArgTestClass;

	/** This is the least unit style of the unit tests but until we can mock this better, it is our best choice **/ 
	public class ConstructorParamsWithUnresolvedData {

		[Test]
		public function shouldReturnFoundParameters():void {
			var klass:Klass = new Klass( ConstructorUndefinedArgTestClass );

			var xml:XML = <constructor>
							<parameter index="1" type="*" optional="true"/>
							<parameter index="2" type="*" optional="true"/>
							<parameter index="3" type="*" optional="true"/>
						  </constructor>;

			var constructor:Constructor = new Constructor( xml, klass );

			assertNotNull( constructor.parameterTypes );
			assertEquals( int, constructor.parameterTypes[ 0 ] );
			assertEquals( String, constructor.parameterTypes[ 1 ] );
			assertEquals( Number, constructor.parameterTypes[ 2 ] );
		}
	}
}
