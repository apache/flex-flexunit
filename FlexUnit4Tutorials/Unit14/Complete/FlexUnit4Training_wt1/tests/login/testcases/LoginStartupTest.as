package login.testcases
{
	import mx.events.FlexEvent;
	
	import net.digitalprimates.components.login.LoginComponent;
	
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;

	public class LoginStartupTest
	{
		private static const LONG_TIME:int = 500;
		
		private var loginComponent:LoginComponent;
		
		[Before(async, ui)]
		public function setup():void
		{
			loginComponent = new LoginComponent();
			Async.proceedOnEvent( this, loginComponent, FlexEvent.CREATION_COMPLETE );
			
			UIImpersonator.addChild( loginComponent );

		}
				
		[After(async, ui)]
		public function teardown():void
		{
			UIImpersonator.removeChild( loginComponent );
			loginComponent = null;

		}
		[Test(ui)]
		public function shouldReturnEmptyFieldsOnStartup():void {
			assertThat( loginComponent.usernameTI.text == '' );
			assertThat( loginComponent.passwordTI.text == '' );

		} 

	}
}