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
package org.flexunit.internals.runners.statements.mock
{
	import org.flexunit.internals.runners.statements.ExpectAsync;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	
	public class TestableExpectAsync extends ExpectAsync
	{
		public var errorWasCaught : Boolean = false;
		public var timersWereRestarted : Boolean = false;
		
		public function TestableExpectAsync(objectUnderTest:Object, statement:IAsyncStatement)
		{
			super(objectUnderTest, statement);
		}
		
		public function callProtect( method : Function, ...parameters ) : void
		{
			protect( method, parameters );
		}
		
		override protected function protect(method:Function, ...parameters):void
		{
			try {
				if ( parameters && parameters.length>0 ) {
					method.apply( this, parameters );
				} else {
					method();
				}
				
				if ( hasPendingAsync ) { 
					timersWereRestarted = true;
				} 
				
			} 
			catch (error:Error) {
				errorWasCaught = true;
			} 
		}
	}
}