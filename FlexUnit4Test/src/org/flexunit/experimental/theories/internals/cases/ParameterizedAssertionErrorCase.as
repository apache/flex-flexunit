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
package org.flexunit.experimental.theories.internals.cases
{
	import org.flexunit.Assert;
	import org.flexunit.experimental.theories.internals.ParameterizedAssertionError;

	public class ParameterizedAssertionErrorCase
	{
		//TODO: Ensure that these tests and this test case are being implemented correctly.
		//It is currently impossible to test the stringValueOf function.
		
		[Test(description="Ensure that the ParameterizedAssertionError constructor is correctly assigning parameter values")]
		public function constructorTest():void {
			var targetException:Error = new Error();
			var methodName:String = "methodName";
			var params:Array = new Array("valueOne", "valueTwo");
			
			var parameterizedAssertionError:ParameterizedAssertionError = new ParameterizedAssertionError(targetException, methodName, "valueOne", "valueTwo");
			
			var message:String = methodName + " " + params.join( ", " );
			Assert.assertEquals( message, parameterizedAssertionError.message);
			Assert.assertEquals( targetException, parameterizedAssertionError.targetException );
		}
		
		[Test(description="Ensure that the join function is correctly joining the delimiter to the other parameters")]
		public function joinTest():void {
			var delimiter:String = ", ";
			var params:Array = new Array("valueOne", "valueTwo", "valueThree");
			
			var message:String = params.join( delimiter );
			Assert.assertEquals( message, ParameterizedAssertionError.join(delimiter, "valueOne", "valueTwo", "valueThree") );
		}
	}
}