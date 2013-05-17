package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;

    /**
     * @private
     */
	public class TestMethodOrder {
		protected static var testUnassignedComplete:Boolean = false;
		protected static var testOneComplete:Boolean = false;
		protected static var testTwoComplete:Boolean = false;
		protected static var testThreeComplete:Boolean = false;
		protected static var testFourComplete:Boolean = false;
		protected static var testNinetyComplete:Boolean = false;

		
		[Test]
		public function testOrderUnassigned() : void {
			testUnassignedComplete = true
			
			Assert.assertFalse( testOneComplete );
			Assert.assertFalse( testTwoComplete );
			Assert.assertFalse( testThreeComplete );
			Assert.assertFalse( testFourComplete );
			Assert.assertFalse( testNinetyComplete );
		}
		
		[Test(order=1)]
	    public function testOrderOne() : void {
	    	testOneComplete = true;
	    	
			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertFalse( testTwoComplete );
	    	Assert.assertFalse( testThreeComplete );
	    	Assert.assertFalse( testFourComplete );
	    	Assert.assertFalse( testNinetyComplete );
	    }

		[Test(order=2)]
	    public function testOrderTwo() : void {
	    	testTwoComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertFalse( testThreeComplete );
	    	Assert.assertFalse( testFourComplete );
	    	Assert.assertFalse( testNinetyComplete );

	    }

		[Test(order=4)]
	    public function testOrderFour() : void {
	    	testFourComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertTrue( testTwoComplete );
	    	Assert.assertTrue( testThreeComplete );
	    	Assert.assertFalse( testNinetyComplete );

	    }

		[Test(order=90)]
	    public function testOrderNinety() : void {
	    	testNinetyComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertTrue( testTwoComplete );
	    	Assert.assertTrue( testThreeComplete );
	    	Assert.assertTrue( testFourComplete );

	    }

		[Test(order=3)]
	    public function testOrderThree() : void {
	    	testThreeComplete = true;

			Assert.assertTrue( testUnassignedComplete );
	    	Assert.assertTrue( testOneComplete );
	    	Assert.assertTrue( testTwoComplete );
	    	Assert.assertFalse( testFourComplete );
	    	Assert.assertFalse( testNinetyComplete );

	    }
	}
}