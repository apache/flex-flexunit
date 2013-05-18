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
package org.flexunit.internals.runners.statements.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.runners.statements.RunAftersClass;
	import org.flexunit.runners.model.mocks.FrameworkMethodMock;
	import org.flexunit.token.ChildResult;
	import org.flexunit.token.mocks.AsyncTestTokenMock;

	public class RunAftersClassCase
	{
		//TODO: Ensure that these tests and this test case are properly designed
		
		protected var runAftersClass:RunAftersClass;
		protected var frameworkMethodMock:FrameworkMethodMock;
		protected var afters:Array;
		protected var target:Object;
		
		[Before(description="Create an instance of the RunAftersClass class")]
		public function createRunAftersClass():void {
			frameworkMethodMock = new FrameworkMethodMock();
			afters = [frameworkMethodMock];
			target = new Object();
			runAftersClass = new RunAftersClass(afters, target);
		}
		
		[After(description="Remove the reference to the instance of the RunAftersClass class")]
		public function destroyRunAftersClass():void {
			runAftersClass = null;
			frameworkMethodMock = null;
			afters = null;
			target = null;
		}
		
		//TODO: It currently is hard to determine which IAsyncStatement is being returned with the withPotentialAsync function
		[Test(description="Ensure that the overridden withPotentialAsync function returns the correct instance of an IAsyncStatement when the metadata does not have an 'AfterClass'")]
		public function withPotentialAsyncNoAfterClassTest():void {
			frameworkMethodMock.mock.method("getSpecificMetaDataArg").withArgs("AfterClass", "async").once.returns("notTrue");
			
			runAftersClass.handleChildExecuteComplete(new ChildResult(new AsyncTestTokenMock()));
			
			frameworkMethodMock.mock.verify();
		}
		
		[Test(description="Ensure that the overridden withPotentialAsync function returns the correct instance of an IAsyncStatement when the metadata has an 'AfterClass'")]
		public function withPotentialAsyncHasAfterClassTest():void {
			frameworkMethodMock.mock.method("getSpecificMetaDataArg").withArgs("AfterClass", "async").once.returns("true");
			
			runAftersClass.handleChildExecuteComplete(new ChildResult(new AsyncTestTokenMock()));
			
			frameworkMethodMock.mock.verify();
		}
		
		[Test(description="Ensure that the toString function returns the correct string value")]
		public function toStringTest():void {
			Assert.assertEquals( "RunAftersClass", runAftersClass.toString() );
		}
	}
}