package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;

    /**
     * @private
     */
	public class TestIgnore {
		protected static var testCounter:int = 0;

		[After]
		public function checkTestCount():void {
			if ( testCounter != 1 ) {
				Assert.fail( "Ignored test ran");
			}
		}

		[Ignore]
		[Test]
	    public function testOne() : void {
	    	testCounter++;
	    }

		[Test]
	    public function testTwo() : void {
	    	testCounter++;
	    }
	}
}