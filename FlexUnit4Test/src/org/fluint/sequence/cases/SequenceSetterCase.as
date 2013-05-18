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
package org.fluint.sequence.cases
{
	import org.flexunit.Assert;
	import org.flexunit.async.mocks.EventDispatcherMock;
	import org.fluint.sequence.SequenceSetter;

	public class SequenceSetterCase
	{
		protected var sequenceSetter:SequenceSetter;
		protected var target:EventDispatcherMock;
		protected var props:Object;
		
		[Before(description="Create an instance of the SequenceSetter class")]
		public function createSequenceSetter():void {
			target = new EventDispatcherMock();
			props = new Object();
			sequenceSetter = new SequenceSetter(target, props);
		}
		
		[After(description="Remove the reference to the instance of the SequenceSetter class")]
		public function destroySequenceSetter():void {
			sequenceSetter = null;
			target = null;
			props = null;
		}
		
		[Test(description="Ensure that the target property is correctly obtained")]
		public function getTargetTest():void {
			Assert.assertEquals( target, sequenceSetter.target );
		}
		
		[Test(description="Ensure that the props property is correctly obtained")]
		public function getPropsTest():void {
			Assert.assertEquals( props, sequenceSetter.props );
		}
		
		//TODO: How can a test be written for this function?
		[Test(description="Ensure that the execute function correctly adds the props' properties to the target's properties")]
		public function executeTest():void {
			
		}
	}
}