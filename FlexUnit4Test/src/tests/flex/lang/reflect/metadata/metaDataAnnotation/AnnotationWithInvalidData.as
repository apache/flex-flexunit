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
package tests.flex.lang.reflect.metadata.metaDataAnnotation {
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	public class AnnotationWithInvalidData {

		[Test(expects="ArgumentError")]
		public function shouldThrowError():void {
			var annotation:MetaDataAnnotation = new MetaDataAnnotation( null );
		}

		[Test]
		public function shouldReturnEmptyStringForName():void {
			var xml:XML = <metadata/>; 
			var annotation:MetaDataAnnotation = new MetaDataAnnotation( xml );
			
			assertEquals( 0, annotation.name.length );
		}

		[Test]
		public function shouldReturnEmptyArrayForArguments():void {
			var xml:XML = <metadata/>; 
			var annotation:MetaDataAnnotation = new MetaDataAnnotation( xml );
			
			assertNotNull( annotation.arguments );
			assertEquals( 0, annotation.arguments.length );
		}

		[Test]
		public function shouldReturnFalseForAnyHas():void {
			var xml:XML = <metadata/>; 
			var annotation:MetaDataAnnotation = new MetaDataAnnotation( xml );
			
			assertFalse( annotation.hasArgument( "Test" ) );
		}

		[Test]
		public function shouldReturnNullForAnyGet():void {
			var xml:XML = <metadata/>; 
			var annotation:MetaDataAnnotation = new MetaDataAnnotation( xml );
			
			assertNull( annotation.getArgument( "Test" ) );
		}

		[Test]
		public function shouldReturnEqualForCompare():void {
			var xml1:XML = <metadata/>; 
			var xml2:XML = <metadata/>; 
			var annotation1:MetaDataAnnotation = new MetaDataAnnotation( xml1 );
			var annotation2:MetaDataAnnotation = new MetaDataAnnotation( xml2 );
			
			assertTrue( annotation1.equals( annotation2 ) );
		}
	}
}