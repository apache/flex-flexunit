package math.testcases
{
	import flash.geom.Point;
	
	import net.digitalprimates.math.Circle;

	public class CircleConstructorTest
	{
		[Test(expects="RangeError")]
		public function shouldThrowRangeError():void {
			trace( "Test" );
			var someCircle:Circle = new Circle( new Point( 10, 10 ), -5 );
		}
	}
}