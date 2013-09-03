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
package org.flexunit.constants {
	public class AnnotationArgumentConstants {
		/**
		 * Argument constant used in the Test metadata when specifying a TestNG Style parameterized test
		 */
		public static const DATAPROVIDER:String = "dataProvider";

		/**
		 * Argument constant used in the Test, Before, After, BeforeClass and AfterClass metadata 
		 * to specify that Asynchronous functionality should be enabled for this method.
		 */
		public static const ASYNC:String = "async";
		
		/**
		 * Argument constant used in the Test metadata to indicate that this test is expected to
		 * throw an error.
		 * 
		 * This is a synonym for expected
		 */
		public static const EXPECTS:String = "expects";

		/**
		 * Argument constant used in the Test metadata to indicate that this test is expected to
		 * throw an error.
		 * 
		 * This is a synonym for expects
		 */
		public static const EXPECTED:String = "expected";
		
		/**
		 * Argument constant used in the Test metadata to indicate that this test is expected to
		 * complete within the specified timeout. 
		 * 
		 */
		public static const TIMEOUT:String = "timeout";

		/**
		 * Argument constant used in the DataPoints or Parameters metadata to indicate that 
		 * data for this parameter will be loaded asynchronously. This constant references
		 * an implementation of IExternalDataLoader as a static in the same class
		 * 
		 */
		public static const LOADER:String = "loader";
		
		/**
		 * Argument constant usable in all metadata to indicate an order of operation as
		 * compared to other metadata of the same type.
		 * 
		 */
		public static const ORDER:String = "order";
	}
}