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
package tests.org.flexunit.assert.that {
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	
	import org.flexunit.assertThat;
	import org.hamcrest.Matcher;
	import org.hamcrest.number.greaterThan;

	public class AssertThatCase {
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var matcher:Matcher; 

		[Test]
		public function shouldPass() : void {
			var value:int = 5;
			
			stub( matcher ).method( "matches" ).args( value ).returns( true );
			
			assertThat( value, matcher );
		}
		
		[Test(expects="org.hamcrest.AssertionError")]
		public function shouldFail() : void {
			var value:int = 5;
			
			stub( matcher ).method( "matches" ).args( value ).returns( false );
			
			assertThat( value, matcher );
		}
	}
}