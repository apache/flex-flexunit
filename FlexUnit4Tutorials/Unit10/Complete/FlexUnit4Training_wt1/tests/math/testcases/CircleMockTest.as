package math.testcases
{
	import mockolate.runner.MockolateRule;
	
	import net.digitalprimates.math.Circle;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.notNullValue;

	public class CircleMockTest
	{
		[Rule]
		public var mockRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var mockCircle:Circle;
		
		[Test]
		public function shouldBeNotNull():void {
			assertThat( mockCircle, notNullValue() );
		}
	}
}