package math.testcases
{
	import flash.geom.Point;
	
	import matcher.CloseToPointMatcher;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class GetPointsTest
	{	
		private static const TOLERANCE:Number = .0001;
		
		public static var data:Array = [
			[ new Circle( new Point( 0, 0 ), 5 ), new Point( 5, 0 ), 0 ],
			[ new Circle( new Point( 0, 0 ), 5 ), new Point( -5, 0 ), Math.PI ] ];
		
		[Test(dataProvider="data")]
		public function shouldGetPointsOnCircle( circle:Circle, point:Point, radians:Number ):void {
			assertThat( circle.getPointOnCircle( radians ), new CloseToPointMatcher( point, TOLERANCE ) );
		}
		
		public function GetPointsTest()
		{
		}
	}
}