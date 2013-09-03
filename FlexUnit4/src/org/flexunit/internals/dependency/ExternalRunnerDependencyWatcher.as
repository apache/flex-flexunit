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
	import flash.events.Event;
	
	import org.flexunit.runner.external.IExternalDependencyRunner;
	import org.flexunit.token.AsyncCoreStartupToken;
	
	/**
	 * Watches for external dependencies to be resolved. This class is used by the core
	 * and passed to all IExteranalDependencyRunner instances to monitor their resolution.
	 * 
	 * It effectively prevents the core from beginning tests until all dependencies are resolved.
	 *  
	 * @author mlabriola
	 * 
	 */
	public class ExternalRunnerDependencyWatcher implements IExternalRunnerDependencyWatcher {
		
		/**
		 * @private
		 */
		private var _token:AsyncCoreStartupToken;
		/**
		 * @private
		 */
		private var _pendingCount:int;

		/**
		 * Returns the start up <code>AsyncCoreStartupToken</code> that the FlexUnit core 
		 * uses to wait for the resolution of all dependencies
		 * 
		 */
		public function get token():AsyncCoreStartupToken {
			return _token;
		}
		
		/**
		 * Indicates if there are still unresolved dependencies in any runner
		 *  
		 * @return true is all dependencies have been resolved
		 * 
		 */
		public function get allDependenciesResolved():Boolean {
			return (pendingCount==0);
		}
		
		/**
		 * Returns the number of pending start ups
		 */
		public function get pendingCount():int {
			return _pendingCount;
		}
		
		/**
		 * Monitors an IExternalDependencyResolver for success or failure to resolve a dependency
		 * 
		 * @param dr and IExternalDependencyResolver
		 * 
		 */		
		protected function monitorForDependency( dr:IExternalDependencyResolver ):void {
			dr.addEventListener( ExternalDependencyResolver.ALL_DEPENDENCIES_FOR_RUNNER_RESOLVED, handleRunnerReady );
			dr.addEventListener( ExternalDependencyResolver.DEPENDENCY_FOR_RUNNER_FAILED, handleRunnerFailed );
		}
		
		/**
		 * Cleans up after an IExternalDependencyResolver succeeds or fails in resolving a dependency
		 * 
		 * @param dr and IExternalDependencyResolver
		 * 
		 */		
		protected function cleanupListeners( dr:IExternalDependencyResolver ):void {
			dr.removeEventListener( ExternalDependencyResolver.ALL_DEPENDENCIES_FOR_RUNNER_RESOLVED, handleRunnerReady );
			dr.removeEventListener( ExternalDependencyResolver.DEPENDENCY_FOR_RUNNER_FAILED, handleRunnerFailed );
		}
		
		/**
		 * Notifies the FlexUnit core that all dependencies watched by this instance are resolved 
		 * 
		 */		
		protected function sendReadyNotification():void {
			token.sendReady();
		}
		
		/**
		 * Event listener that is notified when a given runner has all of its dependencies resolved 
		 * @param event
		 * 
		 */
		protected function handleRunnerReady( event:Event ):void {
			var dr:IExternalDependencyResolver = event.target as IExternalDependencyResolver;
			
			cleanupListeners( dr );
			_pendingCount--;
			
			if ( allDependenciesResolved ) {
				sendReadyNotification();
			}
		}

		/**
		 * Event listener that is notified when a given runner has failed to resolve dependencies
		 * @param event
		 * 
		 */
		protected function handleRunnerFailed( event:Event ):void {
			var dr:IExternalDependencyResolver = event.target as IExternalDependencyResolver;
			
			cleanupListeners( dr );
			_pendingCount--;
			
			if ( allDependenciesResolved ) {
				sendReadyNotification();
			}
		}

		/**
		 * Tells this watcher to monitor an additional IExternalDependencyResolver
		 * 
		 * @param dr IExternalDependencyResolver
		 * 
		 */
		public function watchDependencyResolver( dr:IExternalDependencyResolver ):void {
			if ( dr && !dr.ready ) {
				_pendingCount++;
				monitorForDependency( dr );
			}
		}
		
		/**
		 * Constructor.
		 */
		public function ExternalRunnerDependencyWatcher() {
			this._token = new AsyncCoreStartupToken();
		}
	}
}