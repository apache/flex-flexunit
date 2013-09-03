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
package tests.org.flexunit.assert.dynamicApp {
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	
	import org.flexunit.Assert;
	
	import tests.org.flexunit.assert.dynamicApp.helper.AsserterHelper;

	public class DynamicAsserterCase {
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var assertObj:AsserterHelper; 
		
		[Test(description="Ensure that the assertWithApply function correctly runs the function with the parameter array")]
		public function shouldPassUsingApply():void {
			var obj1:Object = new Object();
			var obj2:Object = new Object();
			
			stub( assertObj ).method( "assert" ).args( obj1,obj2 );
			
			Assert.assertWithApply( assertObj.assert, [obj1,obj2] );
		}
		
		[Test(description="Ensure that the assertWith function correct runs the function with the list of paramters")]
		public function shouldPassUsingInvoke():void {
			
			var obj1:Object = new Object();
			var obj2:Object = new Object();
			
			stub( assertObj ).method( "assert" ).args( obj1,obj2 );
			
			Assert.assertWith( assertObj.assert, obj1, obj2 );
		}
	}
}