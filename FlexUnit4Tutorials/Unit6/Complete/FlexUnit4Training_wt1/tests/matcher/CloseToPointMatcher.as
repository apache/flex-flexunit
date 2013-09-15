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
package matcher
{
	import flash.geom.Point;
	
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;
	
	public class CloseToPointMatcher extends TypeSafeMatcher
	{
		private var point:Point;
		private var tolerance:Number;
		
		public function CloseToPointMatcher( point:Point, tolerance:Number ) {
			super(Point);
			this.point = point;
			this.tolerance = tolerance;
		}
		
		override public function matchesSafely(item:Object):Boolean {
			var distance:Number = Point.distance( item as Point, point );
			
			return( Math.abs( distance ) - tolerance < 0 );
		}
		
		override public function describeTo(description:Description):void {
			description.appendText( "point " ).appendText( point.toString() );
		}
	}
}