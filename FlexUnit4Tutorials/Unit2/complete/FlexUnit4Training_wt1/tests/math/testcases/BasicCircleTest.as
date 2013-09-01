package math.testcases {
	import flash.geom.Point;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.asserts.assertEquals;
	
	public class BasicCircleTest {		

		[Test]
		public function shouldReturnProvidedRadius():void {
			var circle:Circle = new Circle( new Point( 0, 0 ), 5 );
			assertEquals( 5, circle.radius );
		}
		
	}
}