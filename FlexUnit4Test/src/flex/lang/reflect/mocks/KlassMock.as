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
	
	import flex.lang.reflect.Constructor;
	import flex.lang.reflect.Field;
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	import flex.lang.reflect.metadata.MetaDataAnnotation;

	/**
	 * KlassMock - Implementation mock 
	 * 
	 */
	public class KlassMock extends Klass
	{
		public var mock:Mock;
		
		/**
		 * Constructor
		 * 
		 */
		public function KlassMock( clazz:Class ) {
			mock = new Mock( this );
			
			super(clazz);
		}
		
		override public function get asClass():Class {
			return mock.asClass;
		}

		override public function get name():String {
			return mock.name;			
		}

		override public function get metadata():Array {
			return mock.metaData;
		}

		override public function get constructor():Constructor {
			return mock.constructor;
		}

		override public function getField( name:String ):Field {
			return mock.getField;
		}
		
		override public function get fields():Array {
			return mock.fields;
		}
		
		override public function getMethod( name:String ):Method {
			return mock.getMethod;
		}
		
		override public function get methods():Array {
			return mock.methods;
		}
		
		override public function get interfaces():Array {
			return mock.interfaces;
		}
		
		override public function get packageName():String {
			return mock.packageName;
		}

		override public function get superClass():Class {
			return mock.superClass();
		}
		
		override public function get classDef():Class {
			return mock.classDef;
		}

		override public function descendsFrom( clazz:Class ):Boolean {
			return mock.descendsFrom( clazz );
		}

		override public function hasMetaData( name:String ):Boolean {
			return mock.hasMetaData( name );
		}
		
		override public function getMetaData( name:String ):MetaDataAnnotation {
			return mock.getMetaData( name );
		} 

	}
}