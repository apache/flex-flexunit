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
	import flex.lang.reflect.Field;
	
	import org.flexunit.internals.dependency.ExternalDependencyResolver;
	import org.flexunit.internals.dependency.IExternalDependencyResolver;

	/**
	 * ExternalDependencyToken follows a pattern similar to the AsyncToken in Flex
	 * to notify interested resolvers when a dependency has been resolved.
	 * 
	 * @author mlabriola
	 * 
	 */
	public class ExternalDependencyToken {
		/**
		 * @private 
		 */
		private var resolver:IExternalDependencyResolver;
		/**
		 * @private 
		 */
		private var _targetField:Field;

		/**
		 * The field where the final data loaded from this external dependency will reside
		 * 
		 * @return a Field instance 
		 * 
		 */
		public function get targetField():Field
		{
			return _targetField;
		}

		public function set targetField(value:Field):void
		{
			_targetField = value;
		}

		/**
		 * Adds a IExternalDependencyResolver to this token to be notified when success or failure occurs
		 * 
		 * @param adr an IExternalDependencyResolver
		 * 
		 */
		public function addResolver( adr:IExternalDependencyResolver ):void {
			resolver = adr;	
		}

		/**
		 * Removes a IExternalDependencyResolver so that it will no longer be notified of future success or failure
		 *  
		 * @param adr IExternalDependencyResolver
		 * 
		 */
		public function removeResolver( adr:IExternalDependencyResolver ):void {
			if ( resolver == adr ) {
				resolver = null;
			}
		}

		/**
		 * Notifies the resolver of successful data retrieval
		 *  
		 * @param data Only needed when using an IExternalDependencyLoader and not an IExternalDependencyValue
		 * 
		 */
		public function notifyResult( data:Object=null ):void {
			resolver.dependencyResolved( this, data );			
		}

		/**
		 * Notifies the resolver of a failure
		 *  
		 * @param errorMessage is a string with a description of the fault
		 * 
		 */
		public function notifyFault( errorMessage:String ):void {
			resolver.dependencyFailed( this, errorMessage );
		}

		/**
		 * Constructor 
		 * 
		 */
		public function ExternalDependencyToken( ) {
		}
	}
}
