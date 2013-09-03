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
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;

	public class SequencerWithDecorationCase
	{
		//TODO: This entire test case needs to be created.  Does the handleChildExecuteComplete method need to be called in order to
		//test the overriden function?  Since myToken is created, how do we test the catch part of the try catch statment of executeStep?
		
		protected var sequencerWithDecoration:SequencerWithDecoration;
		protected var afters:Array;
		protected var target:Object;
		
		[Before(description="Create an instance of the SequncerWithDecoration class")]
		public function createSequencerWithDecoration():void {
			afters = new Array();
			target = new Object();
			sequencerWithDecoration = new SequencerWithDecoration(afters, target);
		}
		
		[After(description="Remove the reference to the SequncerWithDecoration class")]
		public function destroySequencerWithDecoration():void {
			sequencerWithDecoration = null;
			target= null;
			afters = null;
		}
		
		[Test(description="Ensure that the executeStep function correctly works when no exception is thrown")]
		public function executeStepNoErrorTest():void {
			
		}
		
		[Test(description="Ensure that the executeStep function correctly works when an exception is thrown")]
		public function executeStepErrorTest():void {
			
		}
	}
}