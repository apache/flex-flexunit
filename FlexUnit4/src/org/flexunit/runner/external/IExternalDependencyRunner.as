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
	import flash.events.IEventDispatcher;
	
	import org.flexunit.internals.dependency.IExternalRunnerDependencyWatcher;
	import org.flexunit.runner.IRunner;

	/**
	 * IExternalDependencyRunner instances are IRunners which support the notion of external
	 * dependencies or data that is not present until a potentially asynchronous operation occurs
	 * 
	 * @author mlabriola
	 * 
	 */
	public interface IExternalDependencyRunner extends IRunner {
		/**
		 * Setter for a dependency watcher. This is a class that implements IExternalRunnerDependencyWatcher
		 * and watches for any external dependencies (such as loading data) are finalized before execution of
		 * tests is allowed to commence.  
		 * 		 
		 * @param value An implementation of IExternalRunnerDependencyWatcher
		 */

		function set dependencyWatcher( value:IExternalRunnerDependencyWatcher ):void;
		/**
		 * 
		 * Setter to indicate an error occured while attempting to load exteranl dependencies
		 * for this test. It accepts a string to allow the creator of the external dependency
		 * loader to pass a viable error string back to the user.
		 * 
		 * @param value The error message
		 * 
		 */
		function set externalDependencyError( value:String ):void;
	}
}