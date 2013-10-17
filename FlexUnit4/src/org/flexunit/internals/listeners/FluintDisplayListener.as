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
package org.flexunit.internals.listeners
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.runner.Description;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.RunListener;
	
	/**
	 * Extends RunListender. It defines testFinished, testIgnored, testAssumptionFailure, and testFailure.
	 * The other overrides currently override already empty methods.
	 * 
	 */
	public class FluintDisplayListener extends RunListener
	{
		/**
		 * @private
		 */
		private var lastFailedTest:IDescription;
		
		[Bindable]
		/**
		 * testResults is used to hold the results of the tests.
		 * It is bindable so that it can be used as a data provider for views. 
		 */
		public var testResults:ArrayCollection = new ArrayCollection();
		 
		/**
		 * @inheritDoc 
		 */
		override public function testRunStarted( description:IDescription ):void{
			
		}

		/**
		 * @inheritDoc 
		 */
		override public function testRunFinished( result:Result ):void {
			
		}
		
		/**
		 * @inheritDoc 
		 */
		override public function testStarted( description:IDescription ):void {
		}
	
		/**
		 * Adds the results of the test to the <code>testResults</code> ArrayCollection.
		 * @inheritDoc 
		 */
		override public function testFinished( description:IDescription ):void {
			
		//	if(description.displayName != lastFailedTest.displayName){
				testResults.addItem(description);
		//	}
		}
		
		override public function testIgnored( description:IDescription ):void {
			testResults.addItem(description);
		}
		override public function testAssumptionFailure( failure:Failure ):void {
			testResults.addItem(failure);
		}
	
		override public function testFailure( failure:Failure ):void {
			lastFailedTest = failure.description;
			testResults.addItem(failure);
			
		}
	}
}