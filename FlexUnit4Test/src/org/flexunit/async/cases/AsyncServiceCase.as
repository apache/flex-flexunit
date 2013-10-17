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
package org.flexunit.async.cases
{
	import flash.events.Event;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.flexunit.async.Async;

	public class AsyncServiceCase
	{
		private var httpService:HTTPService;

		[Before]
		public function setupService():void {
			httpService = new HTTPService();
			//service.url = "http://www.flexgrocer.com/product.xml";
		}

		[After]
		public function killService():void {
			httpService = null;	
		}
		
		[Test(async)]
		public function doTest():void {
			Async.registerFailureEvent( this, httpService, FaultEvent.FAULT );
			Async.handleEvent( this, httpService, ResultEvent.RESULT, handleResult, 2000 );
			httpService.send();			
		}

		private function handleResult( event:ResultEvent, passThroughData:Object ): void {
			
		}
		
		public function AsyncServiceCase()
		{
		}
	}
}