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
	import flex.lang.reflect.Field;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;

	public class FieldAsAProperty {

		[Test]
		public function shouldReturnTrueWhenProperty():void {
			var fieldXML:XML = <accessor name="cProp" access="readwrite" type="Array" declaredBy=""/>;
			
			var field:Field = new Field( fieldXML, false, String, true );
			assertTrue( field.isProperty );
		}

		[Test]
		public function shouldReturnValueFromInstance():void {
			var testInstance:LocalTestClass = new LocalTestClass();
			var fieldXML:XML = <accessor name="rwInstanceProperty" access="readwrite" type="String" declaredBy=""/>;
			
			var field:Field = new Field( fieldXML, false, LocalTestClass, true );
			assertEquals( "rwInstancePropertyValue", field.getObj( testInstance ) );
		}

		[Test]
		public function shouldReturnValueFromClass():void {
			var fieldXML:XML = <accessor name="rwStaticProperty" access="readwrite" type="String" declaredBy=""/>;
			
			var field:Field = new Field( fieldXML, true, LocalTestClass, true );
			assertEquals( "rwStaticPropertyValue", field.getObj() );
		}

	}
}

class LocalTestClass {
	private static var _rwStaticProperty:String = "rwStaticPropertyValue";
	public static function get rwStaticProperty():String {
		return _rwStaticProperty;
	}
	
	public static function set rwStaticProperty( value:String ):void {
		_rwStaticProperty = value;
	}
	
	private var _rwInstanceProperty:String = "rwInstancePropertyValue";
	public function get rwInstanceProperty():String {
		return _rwInstanceProperty;
	}
	
	public function set rwInstanceProperty(value:String):void {
		_rwInstanceProperty = value;
	}
}
