package flexUnitTests.flexUnit4.suites.frameworkSuite
{
	import flexUnitTests.flexUnit1.framework.AllFrameworkTests;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestASComponentUse;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAssert;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAsynchronous;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestAsynchronousSetUpTearDown;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterClassOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterClassOrderAsync;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBeforeAfterOrderAsync;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestBindingUse;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestIgnore;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestMXMLComponentUse;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestMethodOrder;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.TestSynchronousSetUpTearDown;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.theorySuite.TheorySuite;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
    /**
     * @private
     */
	public class FlexUnit4Suite {
		public var testAssert:TestAssert;
		public var testIgnore:TestIgnore;
		public var testMethodOrder:TestMethodOrder;
		public var testBeforeAfterOrder:TestBeforeAfterOrder;
		public var testBeforeAfterClassOrder:TestBeforeAfterClassOrder;
		public var testBeforeAfterOrderAsync:TestBeforeAfterOrderAsync;
		public var testBeforeAfterClassOrderAsync:TestBeforeAfterClassOrderAsync;
		public var testAsynchronous:TestAsynchronous;
		public var testSynchronousSetUpTearDown:TestSynchronousSetUpTearDown;
		public var testAsynchronousSetUpTearDown:TestAsynchronousSetUpTearDown;
		public var testASComponentUse:TestASComponentUse;
		public var testMXMLComponentUse:TestMXMLComponentUse;
		public var testBindingUse:TestBindingUse;
		public var theory:TheorySuite;
		
		//public var hamcrest:HamcrestSuite;
		//public var flexUnit1Tests:AllFrameworkTests;
	}
}