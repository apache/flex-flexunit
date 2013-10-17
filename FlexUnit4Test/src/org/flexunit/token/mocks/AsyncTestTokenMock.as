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
package org.flexunit.token.mocks
{
	import com.anywebcam.mock.Mock;
	
	import org.flexunit.token.AsyncTestToken;
	import org.flexunit.token.IAsyncTestToken;
	
	public class AsyncTestTokenMock extends AsyncTestToken
	{
		public var mock:Mock;
		
		override public function get parentToken():IAsyncTestToken {
			return mock.parentToken;
		}
		
		override public function set parentToken(value:IAsyncTestToken):void {
			mock.parentToken = value;
		}
		
		override public function addNotificationMethod(method:Function, debugClassName:String=null):IAsyncTestToken {
			return mock.addNotificationMethod(method, debugClassName);
		}
		
		override public function sendResult(error:Error=null):void {
			mock.sendResult(error);
		}
		
		override public function toString():String {
			return mock.toString();
		}
		
		public function AsyncTestTokenMock(debugClassName:String=null)
		{
			mock = new Mock( this );
			
			super(debugClassName);
		}
	}
}