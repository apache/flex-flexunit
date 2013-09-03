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
package org.flexunit.events.rule {
	public interface IEventExpectation {
		function never():IEventExpectation;
		function once():IEventExpectation;
		function twice():IEventExpectation;
		function thrice():IEventExpectation;
		function times( value:Number ):IEventExpectation;
		function atLeast( value:Number ):IEventExpectation;
		function atMost( value:Number ):IEventExpectation;
		function greaterThan( value:Number ):IEventExpectation;
		function greaterThanOrEqualTo( value:Number ):IEventExpectation;
		function lessThan( value:Number ):IEventExpectation;
		function lessThanOrEqualTo( value:Number ):IEventExpectation;
		function instanceOf( eventType:Class ):IEventExpectation;
		function hasType( typeName:String ):IEventExpectation;
		function calls( method:Function ):IEventExpectation;
		function withTimeout( value:Number ):IEventExpectation;

		function hasPropertyWithValue( propertyName:String, valueOrMatcher:* ):IEventExpectation;
		function hasProperties( value:Object ):IEventExpectation;

		function verify():void;
	}
}