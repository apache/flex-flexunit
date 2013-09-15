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
package math.testcases {
	import flash.geom.Point;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	
	public class BasicCircleTest {		

		[Test]
		public function shouldReturnProvidedRadius():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 );
			assertEquals( 5, circle.radius );
		}
		
		[Test]
		public function shouldComputeCorrectDiameter ():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 ); 
			assertEquals( 10, circle.diameter );
		}
		
		[Test]
		public function shouldReturnProvidedOrigin():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 ); 
			assertEquals( 0, circle.origin.x );
			assertEquals( 0, circle.origin.y );
		}

		
		[Test]
		public function shouldReturnTrueForEqualCircle():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 );
			var circle2:Circle = new Circle( new Point( 0, 0 ), 5 );
			
			assertTrue( circle.equals( circle2 ) );	
		}
		
		[Test]
		public function shouldReturnFalseForUnequalOrigin():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 );
			var circle2:Circle = new Circle( new Point( 0, 5 ), 5);
			
			assertFalse( circle.equals( circle2 ) );
		}
		
		[Test]
		public function shouldReturnFalseForUnequalRadius():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 );
			var circle2:Circle = new Circle( new Point( 0, 0 ), 7);
			
			assertFalse( circle.equals( circle2 ) );
		}
		
		[Test]
		public function shouldGetPointsOnCircle():void {
			
		}
		
		[Test]
		public function shouldThrowRangeError():void {
			
		}

		
	}
}