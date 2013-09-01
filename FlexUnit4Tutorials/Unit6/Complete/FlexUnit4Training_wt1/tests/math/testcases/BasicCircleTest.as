package math.testcases {
	import flash.geom.Point;
	
	import matcher.CloseToPointMatcher;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	
	public class BasicCircleTest {		

		private static const TOLERANCE:Number = .0001;
		private var circle:Circle;
		
		[Before]
		public function setMeUp():void {
			circle = new Circle( new Point( 0, 0 ), 5 );
		}
		
		[After]
		public function tearMeDown():void {
			circle = null;
		}
		
		[Test]
		public function shouldReturnProvidedRadius():void {
			assertEquals( 5, circle.radius );
		}
		
		[Test]
		public function shouldComputeCorrectDiameter():void {
			assertEquals( 10, circle.diameter );
		}
		
		[Test]
		public function shouldReturnProvidedOrigin():void {
			assertEquals( 0, circle.origin.x );
			assertEquals( 0, circle.origin.y );
		}
		
		[Test]
		public function shouldReturnTrueForEqualCircle():void {
			var circle2:Circle = new Circle( new Point( 0, 0 ), 5 );
			
			assertTrue( circle.equals( circle2 ) );	
		}
		
		[Test]
		public function shouldReturnFalseForUnequalOrigin():void {
			var circle2:Circle = new Circle( new Point( 0, 5 ), 5);
			
			assertFalse( circle.equals( circle2 ) );
		}
		
		[Test]
		public function shouldReturnFalseForUnequalRadius():void {
			var circle2:Circle = new Circle( new Point( 0, 0 ), 7);
			
			assertFalse( circle.equals( circle2 ) );
		}
		
		[Test]
		public function shouldGetTopPointOnCircle():void {
			var point:Point = circle.getPointOnCircle( 0 );
			
			assertThat( point, new CloseToPointMatcher( new Point( 5, 0 ), TOLERANCE ) );
		}
		
		[Test]
		public function shouldGetBottomPointOnCircle():void {
			var point:Point = circle.getPointOnCircle( Math.PI );
			
			assertThat( point, new CloseToPointMatcher( new Point( -5, 0 ), TOLERANCE ) );
		}
		
		[Test]
		public function shouldGetRightPointOnCircle():void {
			var point:Point = circle.getPointOnCircle( Math.PI/2 );
			
			assertThat( point, new CloseToPointMatcher( new Point( 0, 5 ), TOLERANCE ) );
		}
		
		[Test]
		public function shouldGetLeftPointOnCircle():void {
			var point:Point = circle.getPointOnCircle( (3*Math.PI)/2 );
			
			assertThat( point, new CloseToPointMatcher( new Point( 0, -5 ), TOLERANCE ) );
		}
		
		[Test(expects="RangeError")]
		public function shouldThrowRangeError():void {
			var someCircle:Circle = new Circle( new Point( 10, 10 ), -5 );
		}
	}
}