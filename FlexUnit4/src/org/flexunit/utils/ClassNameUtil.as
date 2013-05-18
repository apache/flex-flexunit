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
package org.flexunit.utils {
	/**
	 * The <code>ClassNameUtil</code> is responsible for assisting in the formatting of class names.
	 */
	public class ClassNameUtil {
		import flash.utils.getQualifiedClassName;

		/**
		 * Returns a logger friendly class name for the provided instance or class.  The
		 * normal qualified class name will have all "::", "." and "$" replaced with underscores.
		 * 
		 * @param instance or class The Object for which to obtain a logger friendly class name.
		 * 
		 * @return an escaped path that the Logger class can parse
		 */
		public static function getLoggerFriendlyClassName( instanceOrClass:Object ):String {
			var periodReplace:RegExp = /\./g;
			var colonReplace:RegExp = /::/g;
			var dollarSignReplace:RegExp = /\$/g;

			var escapedName:String = getQualifiedClassName( instanceOrClass );
			escapedName = escapedName.replace( periodReplace, "_" );
			escapedName = escapedName.replace( colonReplace, "_" );
			escapedName = escapedName.replace( dollarSignReplace, "_" );

			return escapedName;
		}
		
		/**
		 * Constructor.
		 */
		public function ClassNameUtil() {
		}
	}
}