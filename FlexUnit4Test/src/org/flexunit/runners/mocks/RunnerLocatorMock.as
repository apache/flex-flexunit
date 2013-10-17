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
package org.flexunit.runners.mocks
{
	import com.anywebcam.mock.Mock;
	
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.RunnerLocator;

	[Bindable(event="testMetadata")]
	public class RunnerLocatorMock extends RunnerLocator
	{
		public var mock:Mock;
		
		
		/**
		 * Constructor
		 *
 		 * @param param1
		 * @param param2
		 * @param param3
		 * @param param4
		 * @param param5
		 * @param param6
		 * 
		 * <br/>
		 * All six params are generic arguments for use in testing Constructor.as
		 * See ConstructorCase check_newInstance_valid_number_of_agruments method 
		 */
		public function RunnerLocatorMock( param1:String=null,
										   param2:String=null,
										   param3:String=null,
										   param4:String=null,
										   param5:String=null,
										   param6:String=null,
										   param7:String=null ) {
			mock = new Mock( this );
		}
		
		override public function registerRunnerForTest( test:Object, runner:IRunner ):void {
			mock.registerRunnerForTest( test, runner );
		}
		
		override public function getRunnerForTest( test:Object ):IRunner {
			return getRunnerForTest( test );
		} 	
		
	}
}