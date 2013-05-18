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
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class FieldWithInvalidData {

		[Test(expects="ArgumentError")]
		public function shouldThrowErrorConstructingWithoutDeclaringClass():void {
			
			var field:Field = new Field( null, false, null, false );
		}

		[Test(expects="ArgumentError")]
		public function shouldThrowErrorConstructingFromNullXML():void {
			
			var field:Field = new Field( null, false, String, false );
		}

		[Test(expects="TypeError")]
		public function shouldThrowErrorWhenAskingForType():void {
			var fieldXML:XML = <variable/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			var clazz:Class = field.type;
		}

		[Test]
		public function shouldReturnEmptyStringForName():void {
			var fieldXML:XML = <variable/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertEquals( "", field.name );
		}
		
		[Test]
		public function shouldReturnNullForElementType():void {
			var fieldXML:XML = <variable type="Array"/>
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertNull( field.elementType );
		}
		
		[Test]
		public function shouldReturnEmptyArrayForMetadata():void {
			var fieldXML:XML = <variable/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertNotNull( field.metadata );
			assertEquals( 0, field.metadata.length );
		}
		
		[Test]
		public function shouldReturnFalseForHasMetaData():void {
			var fieldXML:XML = <variable/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			
			assertFalse( field.hasMetaData( "ArrayElementType" ) );
		}
		
		[Test]
		public function shouldReturnNullForGetMetaData():void {
			var fieldXML:XML = <variable/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			
			assertNull( field.getMetaData( "Test" ) );
		}

	}
}