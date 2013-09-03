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
	 * Extension to the IExternalDependencyLoader concept which allows a given class
	 * to act both as a loader and as the final data source without requiring a separate
	 * static variable. This reduces the complexity of reading the test but still allows
	 * the use of the IExternalDependencyLoader for special case situations where a static
	 * setter or related concept may have additional work to do.
	 * 
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyData extends IExternalDependencyLoader {
		/**
		 * Getter for the externally loaded data 
		 * 
		 * @return An Array of externally loaded data 
		 * 
		 */
		function get data():Array;
	}
}