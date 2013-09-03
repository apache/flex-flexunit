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
package org.flexunit.runners.model.cases
{
	import flex.lang.reflect.Klass;
	
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.definitions.FlexUnit4Class;
	import org.flexunit.runners.model.TestClass;

	public class TestClassCase
	{
		//TODO: Ensure that these tests and this test case are being implemented correctly.  Is there a way to properly test the
		//addToMetaDataDictionary function?
		
		protected var testClass:TestClass;
		protected var clazz:Class;
		
		[Before(description="Create an instance of the TestClass class")]
		public function createTestCase():void {
			clazz = FlexUnit4Class;
			testClass = new TestClass( clazz );
		}
		
		[After(description="Remove the reference to the instance of the TestClass class")]
		public function destroyTestCase():void {
			testClass = null;
			clazz = null
		}
		
		[Test(description="Ensure that get klassInfo returns an istance of a class")]
		public function getKlassInfoTest():void {
			var klassInfo:Klass = testClass.klassInfo;
			
			Assert.assertNotNull( klassInfo );
			Assert.assertTrue( klassInfo is Klass );
		}
		
		[Test(description="Ensure that get asClass returns the underlying class")]
		public function getAsClassTest():void {
			Assert.assertEquals( clazz, testClass.asClass );
		}
		
		//TODO: Is there a way to test the get name for a null klassInfo?  Right now klassInfo will always return a non-null value.
		[Test(description="Ensure that get name reutrns the expected class name")]
		public function getNameTest():void {
			Assert.assertEquals( "org.flexunit.internals.builders.definitions::FlexUnit4Class", testClass.name );
		}
		
		//TODO: Is there a way to test the get metadata for a null klassInfo?  Right now klassInfo will always return a non-null value.
		[Ignore("We have a Flex 4/Flex 3 compatibility issue here")]
		[Test(description="Ensure that get metadata returns the expected metadata")]
		public function getMetadataTest():void {
			var metadata:Array = testClass.metadata;
			
			Assert.assertTrue( metadata is Array );
			Assert.assertEquals( 1, metadata.length );
		}
		
		[Test(description="Ensure that the getMetaDataMethods function correctly returns an array with the expected metadata")]
		public function getMetaDataMethodsTest():void {
			var methods:Array = testClass.getMetaDataMethods( 'Test' );
			Assert.assertNotNull( methods );
			Assert.assertEquals( methods.length, 3 );
		}
		
		//TODO: Is there a way to test the toString function for a null klassInfo?  Right now klassInfo will always return a non-null value.
		[Test(description="Ensure the toString function returns the correct string value")]
		public function toStringTest():void {
			var expectedString:String = "TestClass (org.flexunit.internals.builders.definitions::FlexUnit4Class)";
			
			Assert.assertEquals( expectedString, testClass.toString() );
		}
	}
}