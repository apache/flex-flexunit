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
package flex.lang.reflect.mocks
{
	import com.anywebcam.mock.Mock;
	
	import flex.lang.reflect.Method;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	
	public class MethodMock extends Method
	{
		public var mock:Mock;
		
		override public function get metadata():Array {
			return mock.metadata;
		}
		
		override public function get methodXML():XML {
			return mock.methodXML;
		}
		
		override public function get declaringClass():Class {
			return mock.declaringClass;
		}
		
		override public function get name():String {
			return mock.name;
		}
		
		override public function get parameterTypes():Array {
			return mock.parameterTypes;
		}
		
		override public function get returnType():Class {
			return mock.returnType;
		}
		
		override public function get elementType():Class {
			return mock.elementType;
		}
		
		override public function get isStatic():Boolean {
			return mock.isStatic;
		}
		
		override public function apply(obj:Object, argArray:*) : * {
			return mock.apply(obj, argArray);
		}
		
		override public function invoke(obj:Object, ...args) : Object {
			return mock.invokeMethod("invoke", [obj].concat(args));
		}
		
		override public function hasMetaData(name:String) : Boolean {
			return mock.hasMetaData(name);
		}
		
		override public function getMetaData(name:String) : MetaDataAnnotation {
			return mock.getMetaData(name);
		}
		
		public function MethodMock(methodXML:XML = null, isStatic:Boolean = false)
		{
			mock = new Mock( this );
			
			//If no methodXML is passed, provideXML to the Method constructor
			if(!methodXML) {
				methodXML = <mock name="mockXML"/>;
			}
			
			super(methodXML, isStatic);
		}
	}
}