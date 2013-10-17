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
package org.flexunit.reporting.cases
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	import org.flexunit.AssertionError;
	import org.hamcrest.AssertionError;
	import org.flexunit.reporting.FailureFormatter;

	public class FailureFormatterASCase
	{
		//TODO: Ensure that the tests and test case are being implemented correctly
		
		[Test(description="Ensure that a regular Error is a failure")]
		public function isErrorFlexUnitAssertionErrorTest():void {
			Assert.assertTrue( FailureFormatter.isError(new Error()) );
		}
		
		[Test(description="Ensure that a Flex Unit AssertionError is not a failure")]
		public function isErrorNormalErrorTest():void {
			Assert.assertFalse( FailureFormatter.isError(new org.flexunit.AssertionError("test")) );
		}
		
		[Test(description="Ensure that a Hamcrest AssertionError is not a failure")]
		public function isErrorHamcrestAssertionErrorTest():void {
			Assert.assertFalse( FailureFormatter.isError(new org.hamcrest.AssertionError("test")) );
		}
		
		[Test(description="Ensure that a Falex Unit AssertionFailedError is not a failure")]
		public function isErrorFlexUnitAssertionFailedErrorTest():void {
			Assert.assertFalse( FailureFormatter.isError(new flexunit.framework.AssertionFailedError("test")) );
		}

		[Test(description="Ensure that the message string is returned from the xmlEscapeMessage function")]
		public function xmlEscapeMessageWithMessageTest():void {
			var testMessage:String= "testMessage";
			
			Assert.assertEquals( testMessage, FailureFormatter.xmlEscapeMessage(testMessage) );	
		}
		
		[Test(description="Ensure that an empty string is returned from the xmlEscapeMessage function")]
		public function xmlEscapeMessageWithNoMessageTest():void {
			Assert.assertEquals( "", FailureFormatter.xmlEscapeMessage(null) );
		}
	}
}