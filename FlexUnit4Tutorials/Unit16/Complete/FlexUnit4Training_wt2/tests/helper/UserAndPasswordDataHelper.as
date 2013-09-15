/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package helper
{
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runner.external.IExternalDependencyLoader;
	
	public class UserAndPasswordDataHelper implements IExternalDependencyLoader, IResponder
	{
		private var dToken:ExternalDependencyToken;
		private var service:HTTPService;
		
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