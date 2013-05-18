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
	
	import flex.lang.reflect.Method;
	
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.token.AsyncTestToken;
	
	public class FrameworkMethodMock extends FrameworkMethod
	{
		public var mock:Mock;
		
		//TODO: How do I return a value of the method property?
		override public function get method():Method {
			return mock.methud;
		}
		
		override public function get name():String {
			return mock.name;
		}
		
		override public function get metadata():Array {
			return mock.metadata;
		}
		
		override public function getSpecificMetaDataArgValue(metaDataTag:String, key:String):String {
			return mock.getSpecificMetaDataArg(metaDataTag, key);
		}
		
		override public function hasMetaData(metaDataTag:String):Boolean {
			return mock.hasMetaData(metaDataTag);
		}
		
		override public function producesType(type:Class):Boolean {
			return mock.producesType(type);
		}
		
		override public function applyExplosively(target:Object, params:Array):void {
			mock.applyExplosively(target, params);
		}
		
/*		override public function invokeExplosivelyAsync(parentToken:AsyncTestToken, target:Object, ...parameters):void {
			mock.invokeMethod( "invokeExplosivelyAsync", [parentToken, target].concat(parameters) );
		}*/
		
		override public function invokeExplosively(target:Object, ...parameters):Object {
			return mock.invokeMethod( "invokeExplosively", [target].concat(parameters) );
		}
		
		override public function validatePublicVoidNoArg(isStatic:Boolean, errors:Array):void {
			mock.validatePublicVoidNoArg(isStatic, errors);
		}
		
		override public function validatePublicVoid(isStatic:Boolean, errors:Array):void {
			mock.validatePublicVoid(isStatic, errors);	
		}
		
		override public function toString():String {
			return mock.toString();
		}
		
		public function FrameworkMethodMock(method:Method = null)
		{
			mock = new Mock( this );
			
			super(method);
		}
	}
}