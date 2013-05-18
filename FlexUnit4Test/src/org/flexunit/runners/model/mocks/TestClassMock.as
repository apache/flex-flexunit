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
package org.flexunit.runners.model.mocks
{
	import com.anywebcam.mock.Mock;
	
	import flex.lang.reflect.Klass;
	
	import org.flexunit.runners.model.TestClass;
	
	public class TestClassMock extends TestClass
	{
		public var mock:Mock;
		
		override public function get klassInfo():Klass {
			return mock.klassInfo;
		}
		
		override public function get asClass():Class {
			return mock.asClass;
		}
		
		override public function get name():String {
			return mock.name;
		}
		
		override public function get metadata():Array {
			return mock.metedata;
		}
		
		override public function getMetaDataMethods(metaTag:String):Array {
			return mock.getMetaDataMethods(metaTag);
		}
		
		override public function toString():String {
			return mock.toString();
		}
		
		public function TestClassMock(klass:Class = null)
		{
			mock = new Mock(this);
			
			super(klass);
		}
	}
}