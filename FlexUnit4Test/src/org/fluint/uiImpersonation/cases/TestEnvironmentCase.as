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
package org.fluint.uiImpersonation.cases
{
	import flash.display.Sprite;
	
	import mx.core.Container;
	
	import org.flexunit.Assert;
	import org.fluint.uiImpersonation.IVisualEnvironmentBuilder;
	import org.fluint.uiImpersonation.IVisualTestEnvironment;
	import org.fluint.uiImpersonation.VisualTestEnvironmentBuilder;

	public class TestEnvironmentCase
	{
		protected static var testEnvironment:IVisualTestEnvironment;
		
		[BeforeClass]
		public static function beforeClass():void {
			var builder:VisualTestEnvironmentBuilder = VisualTestEnvironmentBuilder.getInstance(); 
			testEnvironment = builder.buildVisualTestEnvironment();
		}
		
		//TODO: Since this is a singleton, it is currently impossible to cover both branches, any way in which this can be remedied?
		[Test(description="Ensure that an instance to the TestEnvironmentBuilder class is obtained the first time")]
		public function getInstanceNotCreatedTest():void
		{
			var builder:VisualTestEnvironmentBuilder = VisualTestEnvironmentBuilder.getInstance(); 
			var newEnvironment:IVisualTestEnvironment = builder.buildVisualTestEnvironment();
			
			Assert.assertTrue( testEnvironment is IVisualTestEnvironment );
			Assert.assertNotNull( testEnvironment );
			
			if ( testEnvironment is Sprite ) {
				Assert.assertNotNull( ( testEnvironment as Sprite ).stage );
			}
		}
		
		[Test(description="Ensure that the same instance to the TestEnvironmentBuilder class is obtained the second time")]
		public function getInstanceCreatedTest():void
		{
			var builder:VisualTestEnvironmentBuilder = VisualTestEnvironmentBuilder.getInstance(); 
			var newEnvironment:IVisualTestEnvironment = builder.buildVisualTestEnvironment();
			
			Assert.assertStrictlyEquals( testEnvironment, newEnvironment );
		}
		
		[Test(order=3,description="Ensure that a focus manager exists on an instance if it is flex-based")]
		public function getFocusManagerCreatedTest():void
		{
			if ( testEnvironment is Container ) {
				Assert.assertNotNull( ( testEnvironment as Container ).focusManager );	
			}
		}
	}
}