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
	
	import matcher.CloseToPointMatcher;
	
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.assertThat;

	public class DistanceTest
	{
		private static const TOLERANCE:Number = .01;
		
		[Rule]
		public var mockRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var mockPoint:Point;
		
		[Test]
		public function shouldBeEqualDistance():void {
			var testPoint:Point = new Point( 5, 5 );
			var endPoint:Point = new Point( 10, 10 );
			var summedPoints:Point;
			
			mock( mockPoint ).method( "add" ).args( testPoint ).returns( new Point( 10, 10 ) ); 
			
			summedPoints = mockPoint.add( testPoint );
			
			assertThat( endPoint, new CloseToPointMatcher( summedPoints, TOLERANCE ) );
		}
	}
}