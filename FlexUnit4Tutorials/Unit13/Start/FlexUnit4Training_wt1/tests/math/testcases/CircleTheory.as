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
	
	import helper.RadiiDataHelper;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.assumeThat;
	import org.hamcrest.number.closeTo;
	import org.hamcrest.number.greaterThan;

	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class CircleTheory 
	{
		private static const TOLERANCE:Number = .0001;
		
		public static var radiiLoader:RadiiDataHelper = new RadiiDataHelper( "xml/radii.xml" );
		
		[DataPoints(loader="radiiLoader")]
		[ArrayElementType("Number")]
		public static var radii:Array;
		
		[DataPoints]
		[ArrayElementType("flash.geom.Point")]
		public static var points:Array = [ new Point( 0, 0 ),
			new Point( 10, 10 ),
			new Point( -5, 5 ),
			new Point( 20, -20 ),
			new Point( -17, -16 ),
			new Point( 5.2, -11.3 ) ];
		
		[Theory]
		public function shouldShowAllRadiiEqual( radius:Number ):void {
			assumeThat( radius, greaterThan( 0 ) );
			var circle:Circle = new Circle( new Point( 0, 0 ), radius );
			assertEquals( radius, circle.radius );
		}
		
		[Theory]
		public function shouldShowAllPointsEqual( origin:Point, radius:Number, radians:Number ):void {
			assumeThat( radius, greaterThan( 0 ) );
			var circle:Circle = new Circle( origin, radius );
			var pointOnCircle:Point = circle.getPointOnCircle( radians );
			
			var distance:Number = Point.distance( origin, pointOnCircle );
			
			assertThat( distance, closeTo( circle.radius, TOLERANCE ) );
		}

		public function CircleTheory()
		{
		}
	}
}