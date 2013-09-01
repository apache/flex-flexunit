package math.testcases
{
	import flash.geom.Point;
	
	import helper.GetPointsDataHelper;
	
	import matcher.CloseToPointMatcher;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class GetPointsTest
	{		
		private static const TOLERANCE:Number = .0001;
		
		public static var getDataPointsLoader:GetPointsDataHelper = new GetPointsDataHelper( "xml/circlePoints.xml" );
		
		[Parameters(loader="getDataPointsLoader")]
		public static var data:Array;
		
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