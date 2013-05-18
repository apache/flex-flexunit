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
package org.flexunit.listeners
{
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IRunListener;
	import org.flexunit.runner.notification.ITemporalRunListener;

	[Deprecated(replacement="TestRunnerBase can be used directly now.", since="4.1")]
	public class UIListener implements ITemporalRunListener
	{
		private var uiListener : ITemporalRunListener;
		
		public function UIListener( uiListener : ITemporalRunListener )
		{
			super();
			this.uiListener = uiListener;
		}
		
		public function testRunStarted( description:IDescription ):void {
			this.uiListener.testRunStarted( description );
		}
		
		public function testRunFinished( result:Result ):void {
			this.uiListener.testRunFinished( result );
		}
		
		public function testStarted( description:IDescription ):void {
			this.uiListener.testStarted(description );
		}
	
		public function testFinished( description:IDescription ):void {
			this.uiListener.testFinished( description );
		}
	
		public function testFailure( failure:Failure ):void {
			this.uiListener.testFailure( failure );
		}
	
		public function testAssumptionFailure( failure:Failure ):void {
			this.uiListener.testAssumptionFailure( failure );
		}
	
		public function testIgnored( description:IDescription ):void {
			this.uiListener.testIgnored( description );
		}
		
		public function testTimed( description:IDescription, runTime:Number ):void {
			this.uiListener.testTimed( description, runTime );
		}
	}
}