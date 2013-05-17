package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;

    /**
     * @private
     */
	public class TestSynchronousSetUpTearDown {
		protected var simpleValue:Number;
		protected var complexObject:Object;
		protected var unitializedBySetup:Object;

		[Before]
		public function setUp():void {
			simpleValue = 5;
			complexObject = new Object();
			complexObject.key = 99;
		}

		[After]		
		public function tearDown():void {
			simpleValue = -1;
			complexObject = null;
			unitializedBySetup = null;
		}
		
		/**
		 * These tests are a little different, we don't ever know the sequence
		 * that are tests will run, so each is going to do a little extra checking
		 * to ensure teardown did actually run 
		 */
		[Test]
	    public function testSetupCreatedComplexObj() : void {
	    	testTearDownDidNotAllowPersist();
	    	Assert.assertNotNull( complexObject );
	    	testInitializeValueForTearDown();
	    }

		[Test]
	    public function testSetupCreatedSimpleVal() : void {
	    	testTearDownDidNotAllowPersist();
	    	Assert.assertEquals( simpleValue, 5 );
	    	testInitializeValueForTearDown();
	    }

		[Test]
	    public function testInitializeValueForTearDown() : void {
	    	unitializedBySetup = new Object();
	    }

		[Test]
	    public function testTearDownDidNotAllowPersist() : void {
	    	Assert.assertNull( unitializedBySetup );
	    }
	}
}