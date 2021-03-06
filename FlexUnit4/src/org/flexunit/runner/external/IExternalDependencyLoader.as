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
package org.flexunit.runner.external {
	/**
	 * Allows the user to specify a static variable of type IExternalDependencyLoader. This class
	 * is responsible for asynchronously loading and parsing any data needed for the test and 
	 * notifying the test framework on success or failure.
	 *  
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyLoader {
		/**
		 * Instructs the IExternalDependencyLoader to find and 
		 * begin resolving dependencies on this class
		 * 
		 * @param testClass
		 * @return an ExternalDependencyToken to monitor success of fault
		 * 
		 */
		function retrieveDependency( testClass:Class ):ExternalDependencyToken;
	}
}