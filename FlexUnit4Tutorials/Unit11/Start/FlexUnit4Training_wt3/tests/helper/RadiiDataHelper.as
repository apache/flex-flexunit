package helper {
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runner.external.IExternalDependencyLoader;

	public class RadiiDataHelper implements IExternalDependencyLoader, IResponder {
		private var dToken:ExternalDependencyToken;
		private var service:HTTPService;

		public function result(data:Object):void {
			var ar:Array = new Array();
			
			var list:XMLList = data.result..node;
			var node:XML;
			
			for ( var i:int = 0; i<list.length(); i++ ) {
				node = list[ i ][ 0 ];
				ar.push( Number( node.text() ) );
			}
			
			dToken.notifyResult( ar );
		}
		
		public function fault(info:Object):void {
			//dToken.notifyResult( fakeData );
			//dToken.notifyFault( info.fault.message );
			dToken.notifyFault( "Totally broken" );
		}
		
		public function retrieveDependency( testClass:Class ):ExternalDependencyToken {
			var asyncToken:AsyncToken = service.send();
			asyncToken.addResponder( this );

			return dToken;
		}
		
		public function RadiiDataHelper( url:String ) {
			service = new HTTPService();
			service.url = url;
			service.resultFormat = "e4x";

			dToken = new ExternalDependencyToken();
		}
	}
}
