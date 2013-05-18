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
package tests.flex.lang.reflect.method {
	import flex.lang.reflect.Method;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class MethodWithInvalidData {

		[Test(expects="ArgumentError")]
		public function shouldThrowErrorConstructing():void {
			var method:Method = new Method( null, false );
		}
		
		[Test]
		public function shouldReturnEmptyStringForName():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			assertEquals( "", method.name );
		}
		
		[Test]
		public function shouldReturnNullForReturnType():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			
			assertNull( method.returnType );
		}	

		[Test]
		public function shouldReturnNullForElementType():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			assertNull( method.elementType );
		}		

		[Test]
		public function shouldReturnEmptyArrayForMetadata():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			assertNotNull( method.metadata );
			assertEquals( 0, method.metadata.length );
		}

		[Test]
		public function shouldReturnFalseForHasMetaData():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			
			assertFalse( method.hasMetaData( "ArrayElementType" ) );
		}

		[Test]
		public function shouldReturnNullForGetMetaData():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			
			assertNull( method.getMetaData( "Test" ) );
		}

		[Test]
		public function shouldReturnNullForDeclaringClass():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			
			assertNull( method.declaringClass );
		}

		[Test]
		public function shouldReturnEmptyArrayForParams():void {
			var xml:XML = <method/>;
			
			var method:Method = new Method( xml );
			
			assertNotNull( method.parameterTypes );
			assertEquals( 0, method.parameterTypes.length );
		}		

		[Test]
		public function shouldReturnNullForParamType():void {
			var xml:XML = <method name="testMethod" declaredBy="String" returnType="Object">
							<parameter index="1" optional="false"/>
						  </method>;
			
			var method:Method = new Method( xml );
			
			assertNotNull( method.parameterTypes );
			assertEquals( 1, method.parameterTypes.length );
			assertNull( method.parameterTypes[ 0 ] );
		}		
		
	}
}