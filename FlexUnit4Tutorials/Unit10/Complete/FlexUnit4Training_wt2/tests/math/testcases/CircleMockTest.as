package math.testcases
{
	import flash.geom.Point;
	
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.notNullValue;

	public class CircleMockTest
	{
		[Rule]
		public var mockRule:MockolateRule = new MockolateRule();
		
		[Mock( type="strict" )]
		public var mockCircle:Circle;
		
		[Test]
		public function shouldBeNotNull():void {
			assertThat( mockCircle, notNullValue() );
		}
		
		[Test]
		public function shouldBeEqualCircleMock():void {
			mock( mockCircle ).getter( "origin" ).atLeast( 1 );
			mock( mockCircle ).getter( "radius" ).atLeast( 1 );
			
			var circle:Circle = new Circle( new Point( 0, 0 ), 0 );
			
			circle.equals( mockCircle );
		}
	}
}