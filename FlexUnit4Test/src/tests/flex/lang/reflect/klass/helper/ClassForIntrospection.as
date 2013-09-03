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
package tests.flex.lang.reflect.klass.helper {
	[Ignore]
	public class ClassForIntrospection extends Ancestor2 implements IFakeInterface {

		public var testVarA:Number;
		public var testVarB:String;

		private var _testPropA:Number;
		private var _testPropB:String;
		
		public static var testStaticVarA:int;
		private static var _testStaticPropB:int;

		public static function get testStaticPropB():int
		{
			return _testStaticPropB;
		}

		public static function set testStaticPropB(value:int):void
		{
			_testStaticPropB = value;
		}

		[ArrayElementType("Number")]
		[Ignore(description="Ignore Me")]
		public function get testPropA():Number
		{
			return _testPropA;
		}
		
		public function set testPropA(value:Number):void
		{
			_testPropA = value;
		}

		public function get testPropB():String
		{
			return _testPropB;
		}

		public function set testPropB(value:String):void
		{
			_testPropB = value;
		}

		public static function returnTrue():Boolean {
			return true;
		}
		
		public function returnFalse():Boolean {
			return false;
		}
		
		[Suite]
		override public function baseMethod():void {
		}
		
		public function ClassForIntrospection( a:int, b:String="" )
		{
		}
	}
}