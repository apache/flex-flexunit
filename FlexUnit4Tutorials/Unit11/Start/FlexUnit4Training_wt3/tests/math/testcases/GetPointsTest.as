package math.testcases
{
	import flash.geom.Point;
	
	import matcher.CloseToPointMatcher;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class GetPointsTest
	{		
		private static const TOLERANCE:Number = .0001;
		
		[Parameters]
		public static var data:Array = [
			[ new Circle( new Point( 0, 0 ), 5 ), new Point( 5, 0 ), 0 ],
			[ new Circle( new Point( 0, 0 ), 5 ), new Point( -5, 0 ), Math.PI ] ];
		
		private var circle:Circle;
		private var point:Point;
		private var radians:Number;
		
		[Test]
		public function shouldGetPointsOnCircle():void {
			assertThat( circle.getPointOnCircle( radians ), new CloseToPointMatcher( point, TOLERANCE ) );
		}
		
		[Test]
		public function shouldReturnDistanceEqualToRadius():void {
			var distance:Number = Point.distance( circle.getPointOnCircle( radians ), circle.origin );
			
			assertThat( distance, equalTo( circle.radius ) );
		}
		
		public function GetPointsTest( circle:Circle, point:Point, 
									   radians:Number )
		{
			this.circle = circle;
			this.point = point;
			this.radians = radians;
		}
	}
}