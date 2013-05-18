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
package org.fluint.uiImpersonation.flex {
	import org.fluint.uiImpersonation.VisualTestEnvironment;
	
	/**
	 * A visual test environment for Flex projects
	 * @author mlabriola
	 * 
	 */
	public class FlexMXVisualTestEnvironment extends VisualTestEnvironment {
		
		/**
		 * 
		 * Constructor
		 * 
		 * <p>Creates a new test environment using the <code>baseClass</code> as a base. This base
		 * needs to be a container that implements <code>IVisualElementContainer</code>. If no base class
		 * is provided, automatically uses mx.core.Container.</p>
		 * 
		 * @param baseClass A class reference to the container the environment should be built from.
		 * 
		 */
		public function FlexMXVisualTestEnvironment(baseClass:Class) {
			super( baseClass );
		}
	}
}