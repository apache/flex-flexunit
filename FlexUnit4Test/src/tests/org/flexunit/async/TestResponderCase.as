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
package tests.org.flexunit.async {
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	
	import org.flexunit.async.ITestResponder;
	import org.flexunit.async.TestResponder;
	
	public class TestResponderCase {
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var responderMock:ITestResponder;
		
		[Test(description="Ensure the result function is correctly called")]
		public function shouldInvokeResultWithData():void {
			var data:Object = new Object();
			var passThrough:Object = new Object();
			var responder:TestResponder = new TestResponder( responderMock.result, responderMock.fault );

			stub( responderMock ).method( "result" ).args( data, passThrough ).once();
			stub( responderMock ).method( "fault" ).never();
			
			responder.result( data, passThrough );
		}
		
		[Test(description="Ensure the fault function is correctly called")]
		public function shouldInvokeFaultWithData():void {
			var info:Object = new Object();
			var passThrough:Object = new Object();
			var responder:TestResponder = new TestResponder( responderMock.result, responderMock.fault );
			
			stub( responderMock ).method( "fault" ).args( info, passThrough ).once();
			stub( responderMock ).method( "result" ).never();
			
			responder.fault( info, passThrough );
		}
	}
}