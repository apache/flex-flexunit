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
package net.digitalprimates.math {
	import flash.geom.Point;

	/**
	 * Class to represent a mathematical circle in addition to circle-specific convenience methods.
	 *  
	 * @author mlabriola
	 * 
	 */	
	public class Circle {
		/**
		 * Constant representing the number of radians in a circle 
		 */		
		public static const RADIANS_PER_CIRCLE:Number = Math.PI * 2;

		private var _origin:Point = new Point( 0, 0 );
		private var _radius:Number;

		/**
		 *  Returns the circle's origin point as a <code>flash.geom.Point</code> object.
		 *  The <code>origin</code> is a read only property supplied during the instantiation
		 *  of the Circle. 
		 * 
		 * @return The circle's origin point. 
		 * 
		 */
		public function get origin():Point {
			return _origin;
		}

		/**
		 *  Returns the circle's radius as a <code>Number</code>.
		 *  The <code>radius</code> is a read only property supplied during the instantiation
		 *  of the Circle.
		 *  
		 *  @return The circle's radius. 
 		 */
		public function get radius():Number {
			return _radius;
		}

		/**
		 *  Returns the circle's diameter based on the <code>radius</code> property. 
		 *  The <code>diameter</code> is a read only property.
		 * 
		 * @see #radius
		 *  @return The circle's diameter. 
 		 */
		public function get diameter():Number {
			return radius * 2;
		}
		
		/**
		 * Returns a point on the circle at a given radian offset.
		 *  
		 * @param t radian position along the circle. 0 is the top-most point of the circle.
		 * @return a Point object describing the cartesian coordinate of the point.
		 * 
		 */	
		public function getPointOnCircle( t:Number ):Point {
			var x:Number = origin.x + ( radius * Math.cos( t ) );
			var y:Number = origin.y + ( radius * Math.sin( t ) );
			
			return new Point( x, y );
		}
		
		/**
		 *
		 * Convenience method for converting radians to degrees.
		 *  
		 * @param radians a radian offset from the top-most point of the circle.
		 * @return a corresponding angle represented in degrees.
		 * 
		 */
		public function radiansToDegrees( radians:Number ):Number {
			return ( ( radians - Math.PI/2 ) * 180 / Math.PI );
		}
		
		/**
		 * Comparison method to determine circle equivalence (same center and radius).
		 *  
		 * @param circle a circle for comparison
		 * @return a boolean indicating if the circles are equivalent
		 * 
		 */
		public function equals( circle:Circle ):Boolean {
			var equal:Boolean = false;

			if ( ( circle ) && ( this.radius == circle.radius ) && ( this.origin ) && ( circle.origin ) ) {
				if ( this.distanceFrom( circle ) == 0 ) 
				{
					equal = true;
				}

			}
				
			return equal;
		}
		public function distanceFrom( circle:Circle ):Number 
		{
			return Point.distance( this.origin, circle.origin )
		}

		/**
		 * Creates a new circle
		 *  
		 * @param origin the origin point of the new circle
		 * @param radius the radius of the new circle
		 * 
		 */		
		public function Circle( origin:Point, radius:Number ) {
			
			if ( ( radius <= 0 ) || isNaN( radius ) ) {
				throw new RangeError("Radius must be a positive Number");
			}
						
			this._origin = origin;
			this._radius = radius;
		}
	}
}