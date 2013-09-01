package math.testcases
{
	import flash.geom.Point;
	
	import matcher.CloseToPointMatcher;
	
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.assertThat;

	public class DistanceTest
	{
		private static const TOLERANCE:Number = .01;
		
		[Rule]
		public var mockRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var mockPoint:Point;
		
		[Test]
		public function shouldBeEqualDistance():void {
			var testPoint:Point = new Point( 5, 5 );
                  	var endPoint:Point = new Point( 10, 10 );
                  	var summedPoints:Point;
                  
                  	mock( mockPoint ).method( "add" ).args( testPoint ).returns( new Point( 10, 10 ) ); 
                  
                  	summedPoints = mockPoint.add( testPoint );
                  
                  	assertThat( endPoint, new CloseToPointMatcher( summedPoints, TOLERANCE ) );

		}
	}
}