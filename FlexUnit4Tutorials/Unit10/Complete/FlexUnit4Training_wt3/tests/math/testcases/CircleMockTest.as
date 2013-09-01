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
package math.testcases
{
	import flash.geom.Point;
	
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	import mockolate.strict;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.object.notNullValue;

	public class CircleMockTest
	{
		[Rule]
		public var mockRule:MockolateRule = new MockolateRule();
		
		[Mock( inject="false", type="strict" )]
		public var mockCircle:Circle;
		
		[Before]
		public function setup():void {
			mockCircle = strict( Circle, "mockCircle", [ new Point( 0, 0 ), 1 ] );
		}
		
		[Test]
		public function shouldBeNotNull():void {
			assertThat( mockCircle, notNullValue() );
		}
		
		[Test]
		public function shouldBeEqualCircleMock():void {
			mock( mockCircle ).getter( "origin" ).returns( new Point( 0, 0 ) ).atLeast( 1 );
			mock( mockCircle ).getter( "radius" ).returns( 1 ).atLeast( 1 );
			
			var circle:Circle = new Circle( new Point( 0, 0 ), 1 );
			
			assertTrue( circle.equals( mockCircle ) );
		}
	}
}