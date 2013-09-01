package helper
{
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runner.external.IExternalDependencyData;
	import org.flexunit.runner.external.IExternalDependencyLoader;
	
	public class UserAndPasswordDataHelper implements IExternalDependencyData, IResponder
	{
		private var dToken:ExternalDependencyToken;
		private var service:HTTPService;
		private var _data:Array;
		public function get data():Array{
			return _data;
		}
		public function result(data:Object):void
		{
			var ar:Array = new Array();
			var innerArray:Array;
			
			var list:XMLList = data.result..user;
			var user:XML;
			var password:XML;
			
			for ( var i:int = 0; i<list.length(); i++ ) {
				user = list[ i ][ 0 ];
				innerArray = new Array();
				innerArray.push( String( user.username.text() ) );
				innerArray.push( String( user.password.text() ) );
				ar.push( innerArray );
			}
			_data = ar;
			dToken.notifyResult( ar );
		}
		
		public function fault(info:Object):void
		{
			dToken.notifyFault( "Totally broken" );
		}
		
		public function retrieveDependency(testClass:Class):ExternalDependencyToken
		{
			var asyncToken:AsyncToken = service.send();
			asyncToken.addResponder( this );
			
			return dToken;
		}
		
		public function UserAndPasswordDataHelper( url:String )
		{
			service = new HTTPService();
			service.url = url;
			service.resultFormat = "e4x";
			
			dToken = new ExternalDependencyToken();
		}
	}
}