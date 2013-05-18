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
package org.hamcrest.core
{
	import org.hamcrest.AbstractMatcherTestCase;
	
	public class GivenTest extends AbstractMatcherTestCase
	{
		[Test]
		public function matchedIsTrueIfTrueExpressionAndValueMatcherMatches():void
		{
			assertMatches( "should match", given( true, anything() ), "anything" );
			assertMatches( "should match", given( true, anything(), false ), "anything" );
		}

		[Test]
		public function matchedIsFalseIfTrueExpressionAndValueMatcherDoesNotMatch():void
		{
			assertDoesNotMatch( "should not match", given( true, not( anything() ) ), "anything" );
			assertDoesNotMatch( "should not match", given( true, not( anything() ), false ), "anything" );
		}
		
		[Test]
		public function matchedIsFalseIfFalseExpression():void
		{
			assertDoesNotMatch( "should not match", given( false, anything() ), "anything" );
			assertDoesNotMatch( "should not match", given( false, anything(), false ), "anything" );
			assertDoesNotMatch( "should not match", given( false, not( anything() ) ), "anything" );
			assertDoesNotMatch( "should not match", given( false, not( anything() ), false ), "anything" );
		}
		
		[Test]
		public function matchedIsTrueIfFalseExpressionAndOptionalOtherwiseSpecifiedAsTrue():void
		{
			assertMatches( "should match", given( false, not( anything() ), true ), "anything" );
			assertMatches( "should match", given( false, not( anything() ), true ), "anything" );
		}
	}
}