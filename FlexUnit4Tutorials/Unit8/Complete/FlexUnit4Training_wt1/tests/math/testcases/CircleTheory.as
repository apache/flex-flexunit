package math.testcases
{
	import flash.geom.Point;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.asserts.assertEquals;

	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class CircleTheory 
	{
		[DataPoints]
		[ArrayElementType("Number")]
		public static var radii:Array = [ 1,2,3,4,5,6,7,8,9,10 ];
		
		[Theory]
		public function shouldShowAllRadiiEqual( radius:Number ):void {
			var circle:Circle = new Circle( new Point( 0, 0 ), radius );
			assertEquals( radius, circle.radius );
		}

		public function CircleTheory()
		{
		}
	}
}