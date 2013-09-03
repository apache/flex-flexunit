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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.helper.ParamDataExt;
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.helper.ParamDataHelper;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runners.Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestParameterized
	{
		private var foo:Parameterized;

		[Parameters]
		public static var dataRetriever:ParamDataExt = new ParamDataExt( "someFakeDataPath.stuff" );

		public static var dataRetriever1:ParamDataHelper = new ParamDataHelper( "TestParameterized.stuff" );

		[Parameters(loader="dataRetriever1")]
		public static var someData:Array;

		[Parameters]
		public static function data2():Array {
			return [ [ 3, 6 ], [ 4, 8 ], [ 5, 10 ], [ 6, 12 ] ];
		}

		private var _input:int;
		
		private var _expected:int;
		
		public function TestParameterized( param1:int, param2:int ) {
			_input = param1;
			_expected = param2;
		}
		
		[Test(async)]
		public function doubleTest():void {
			var timer:Timer = new Timer( 50, 1 );
			var asyncHandler:Function = Async.asyncHandler( this, handleTimerComplete, 6000 );
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, asyncHandler );
			timer.start();
			
			Assert.assertEquals(_expected, _input*2);
		}
		
		//Argument count mismatch... should deal with this better
		private function handleTimerComplete( event:TimerEvent, passThroughData:Object ):void {
		}
	}
}