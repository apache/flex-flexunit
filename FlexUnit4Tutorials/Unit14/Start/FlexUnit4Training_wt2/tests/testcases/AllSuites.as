package testcases
{
	import async.testcases.AsyncSuite;
	
	import login.testcases.LoginSuite;
	
	import math.testcases.CircleSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AllSuites
	{
		public var circleSuite:CircleSuite;
		public var asyncSuite:AsyncSuite;
		public var loginSuite:LoginSuite;
		
	}
}