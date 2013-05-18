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
package org.flexunit.runner.mocks
{
	import com.anywebcam.mock.Mock;
	
	import org.flexunit.runner.IDescription;

	public class DescriptionMock implements IDescription
	{
		public var mock:Mock;
		
		public function DescriptionMock()
		{
			mock = new Mock( this );
		}
		
		public function get children():Array
		{
			return mock.children;
		}
		
		public function get displayName():String
		{
			return mock.displayName;
		}
		
		public function get isSuite():Boolean
		{
			return mock.isSuite;
		}
		
		public function get isTest():Boolean
		{
			return mock.isTest;
		}
		
		public function get testCount():int
		{
			return mock.testCount;
		}
		
		public function getAllMetadata():Array
		{
			return mock.getAllMetadata;
		}
		
		public function get isInstance():Boolean
		{
			return mock.isInstance;
		}
		
		public function get isEmpty():Boolean
		{
			return mock.isEmpty;
		}
		
		public function addChild(description:IDescription):void
		{
			mock.addChild( description );
		}
		
		public function childlessCopy():IDescription
		{
			return mock.childlessCopy();
		}
		
		public function equals(obj:Object):Boolean
		{
			return mock.equals( obj );
		}
		
	}
}