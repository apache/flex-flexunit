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
package flex.lang.reflect.cache {
	import flash.utils.Dictionary;
	import flash.utils.describeType;

	public class ClassDataCache {
		private static var classCache:Dictionary = new Dictionary();
		
		public static function describeType( clazz:Class, refresh:Boolean = false ):XML {
			if ( ( refresh ) || ( classCache[ clazz ] == null ) ) {
				classCache[ clazz ] = flash.utils.describeType( clazz );
			}
				
			return classCache[ clazz ];
		}
		
		public function ClassDataCache() {
		}
	}
}