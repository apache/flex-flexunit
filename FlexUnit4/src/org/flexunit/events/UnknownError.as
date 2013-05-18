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
package org.flexunit.events
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	public class UnknownError extends Error
	{
		public function UnknownError( event:Event )
		{
			var error:Error;
			if ( event.hasOwnProperty( "error" ) ) {
				var errorGeneric:* = event[ "error" ];
				
				if ( errorGeneric is Error ) {
					error = errorGeneric as Error;
				} else if ( errorGeneric is ErrorEvent ) {
					var errorEvent:ErrorEvent = errorGeneric as ErrorEvent;
					error = new Error( "Top Level Error", Object(errorEvent).errorID );
				}
			}
			
			super( error.message, error.errorID );
		}
	}
}