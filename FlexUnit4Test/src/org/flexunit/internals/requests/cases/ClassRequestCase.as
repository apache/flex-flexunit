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
package org.flexunit.internals.requests.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.requests.ClassRequest;
	import org.flexunit.runner.IRunner;
	
	public class ClassRequestCase
	{
		//TODO: Ensure that this test and this test case are being implemented correctly
		
		protected var classRequest:ClassRequest;
		
		[Before(description="Create an instance of ClassRequest")]
		public function createClassRequest():void {
			classRequest = new ClassRequest( Object ); 
		}
		
		[After(description="Remove the reference to the instance of the ClassRequest")]
		public function destroyClassRequest():void {
			classRequest = null;
		}
		
		//TODO: What steps need to be taken in order to determine if the correct iRunner was obtained?
		[Test(description="Ensure the IRunner is successfully obtained")]
		public function getIRunnerTest():void {
			Assert.assertTrue( classRequest.iRunner is IRunner);
		}
	}
}