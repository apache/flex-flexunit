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
package tests.flex.lang.reflect.field {
	import flash.utils.describeType;
	
	import flex.lang.reflect.Field;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	
	public class FieldAsAVariable {

		[Test]
		public function shouldReturnFalseWhenVariable():void {
			var fieldXML:XML = <variable name="testVariable" type="Array"/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertFalse( field.isProperty );
		}

		[Test]
		public function shouldReturnValueFromInstance():void {
			var testInstance:LocalTestClass = new LocalTestClass();
			var fieldXML:XML = <variable name="instanceVar" type="String"/>;
			
			var field:Field = new Field( fieldXML, false, LocalTestClass, false );
			assertEquals( "instanceVarValue", field.getObj( testInstance ) );
		}

		[Test]
		public function shouldReturnValueFromClass():void {
			var fieldXML:XML = <variable name="staticVar" type="String"/>;
			
			var field:Field = new Field( fieldXML, true, LocalTestClass, false );
			assertEquals( "staticVarValue", field.getObj() );
		}
		
		[Test(expects="ArgumentError")]
		public function shouldThrowErrorGettingInstanceValueFromClass():void {
			var fieldXML:XML = <variable name="instanceVar" type="String"/>;
			
			var field:Field = new Field( fieldXML, false, LocalTestClass, false );
			var value:* = field.getObj();
		}

		[Test(expects="ArgumentError")]
		public function shouldThrowErrorGettingStaticValueFromInstance():void {
			var testInstance:LocalTestClass = new LocalTestClass();
			var fieldXML:XML = <variable name="staticVar" type="String"/>;
			
			var field:Field = new Field( fieldXML, true, LocalTestClass, false );
			var value:* = field.getObj( testInstance );
		}
	}
}

class LocalTestClass {
	public static var staticVar:String = "staticVarValue";
	public var instanceVar:String = "instanceVarValue";
}
