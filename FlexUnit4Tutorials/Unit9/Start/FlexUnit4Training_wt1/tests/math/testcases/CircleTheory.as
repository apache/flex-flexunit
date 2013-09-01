package math.testcases
{
	import flash.geom.Point;
	
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
		
		[DataPoints]
		[ArrayElementType("Number")]
		public static var radii:Array = [ -5,1,2,3,4,5,6,7,8,9,10 ];
		
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