package flexUnitTests.flexUnit1.framework
{

   import flexunit.framework.TestSuite;
   
   public class AllFrameworkTests
   {
   	public static function suite() : TestSuite
   	{
   		var testSuite:TestSuite = new TestSuite();		
   		
   		testSuite.addTestSuite( TestAssert );
   		testSuite.addTestSuite( TestTestCase );
   		testSuite.addTestSuite( TestTestListener );
   		testSuite.addTestSuite( TestEventfulTestCase );
   		testSuite.addTestSuite( TestAsynchronous );
   		
   		return testSuite;
   	}
   }
}