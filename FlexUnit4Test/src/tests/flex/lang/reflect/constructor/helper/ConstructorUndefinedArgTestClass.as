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
package tests.flex.lang.reflect.constructor.helper {
	/** This class is separate from the others and is only ever instantiated in one class.
	 *  We need to ensure that is true so we can attempt to resolve the constructor arguments.
	 * 
	 * I would make this an internal class, unfortunately flash has problems every resolving params
	 * on those classes
	 */
	public class ConstructorUndefinedArgTestClass {
		public var arg1:int;
		public var arg2:String;
		public var arg3:Number;
		
		public function ConstructorUndefinedArgTestClass( arg1:int=0, arg2:String="testMe", arg3:Number=3.5 ) {
			this.arg1 = arg1;
			this.arg2 = arg2;
			this.arg3 = arg3;
		}
	}
}