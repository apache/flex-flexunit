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
package org.flexunit.runner
{
	/**
	 * Describes an <code>IDescription</code> based on its path, suite, and method
	 */
	public class Descriptor
	{
		/**
		 * @private 
		 */
		public var path:String;
		/**
		 * @private 
		 */
		public var suite:String;
		/**
		 * @private 
		 */
		public var method:String;

		/**
		 * Constructor
		 */
		public function Descriptor(path:String="", suite:String="", method:String="")
		{
			this.path = path;
			this.suite = suite;
			this.method = method;
		}
	}
}