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
package tests.flex.lang.reflect.metadata.metaDataArgument {
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;

	public class ArgumentWithInvalidData {

		[Test(expects="ArgumentError")]
		public function shouldThrowError():void {
			var argument:MetaDataArgument = new MetaDataArgument( null );
		}

		[Test]
		public function shouldReturnEmptyStringForKey():void {
			var xml:XML = <arg/>; 
			var argument:MetaDataArgument = new MetaDataArgument( xml );
			
			assertEquals( 0, argument.key.length );
		}

		[Test]
		public function shouldReturnValueAndKeyAsString():void {
			var xml:XML = <arg/>; 
			var argument:MetaDataArgument = new MetaDataArgument( xml );
			
			assertEquals( "", argument.key );
			assertEquals( "", argument.value );
		}

		[Test]
		public function shouldNotBeUnpaired():void {
			var xml:XML = <arg/>; 
			var argument:MetaDataArgument = new MetaDataArgument( xml );
			
			assertFalse( argument.unpaired );
		}
		
	}
}