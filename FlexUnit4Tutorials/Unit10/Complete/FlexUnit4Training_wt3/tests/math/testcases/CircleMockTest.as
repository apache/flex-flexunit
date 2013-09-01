package math.testcases
{
	import flash.geom.Point;
	
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	import mockolate.strict;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.object.notNullValue;

	public class CircleMockTest
	{
		[Rule]
		public var mockRule:MockolateRule = new MockolateRule();
		
		[Mock( inject="false", type="strict" )]
		public var mockCircle:Circle;
		
		[Before]
		public function setup():void {
			mockCircle = strict( Circle, "mockCircle", [ new Point( 0, 0 ), 1 ] );
		}
		
		[Test]
		public function shouldBeNotNull():void {
			assertThat( mockCircle, notNullValue() );
		}
		
		[Test]
		public function shouldBeEqualCircleMock():void {
			mock( mockCircle ).getter( "origin" ).returns( new Point( 0, 0 ) ).atLeast( 1 );
			mock( mockCircle ).getter( "radius" ).returns( 1 ).atLeast( 1 );
			
			var circle:Circle = new Circle( new Point( 0, 0 ), 1 );
			
			assertTrue( circle.equals( mockCircle ) );
		}
	}
}