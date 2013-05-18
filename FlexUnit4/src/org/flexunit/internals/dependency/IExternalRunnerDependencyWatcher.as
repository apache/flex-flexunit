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
package org.flexunit.internals.dependency {
	import org.flexunit.token.AsyncCoreStartupToken;

	public interface IExternalRunnerDependencyWatcher {
		/**
		 * Returns the start up <code>AsyncCoreStartupToken</code> that the FlexUnit core 
		 * uses to wait for the resolution of all dependencies
		 * 
		 */
		function get token():AsyncCoreStartupToken;		
		/**
		 * Indicates if there are still unresolved dependencies in any runner
		 *  
		 * @return true is all dependencies have been resolved
		 * 
		 */
		function get allDependenciesResolved():Boolean;
		/**
		 * Tells an implementing watcher to monitor an additional IExternalDependencyResolver
		 * 
		 * @param dr IExternalDependencyResolver
		 * 
		 */
		function watchDependencyResolver( dr:IExternalDependencyResolver ):void;
	}
}