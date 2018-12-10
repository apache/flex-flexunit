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
package org.flexunit.runner.manipulation.filters {
	import org.flexunit.runner.IDescription;

	/**
	 * 
	 * Filter that matches method names. A matching method name means the method will be executed
	 * 
	 */
	public class MethodNameFilter extends AbstractFilter {
		/**
		 * @private 
		 */
		private var methodNames:Array;

		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override public function shouldRun(description:IDescription) : Boolean {
			var methodName:String = "";
			
			if ( !description.isTest ) {
				//We are on;y interested in filtering out method names with this filter
				return true;
			}
			
			if ( description && description.displayName ) {
				var namePieces:Array = description.displayName.split( '.' );
				if ( namePieces && namePieces.length > 0 ) {
					methodName = namePieces[namePieces.length-1];
				}
			}
			
			return ( methodNames.indexOf( methodName ) != -1 );			
		}
		
		/**
		 * 
		 * @inheritDoc
		 * 
		 */
		override public function describe(description:IDescription) : String {
			return "Matching method list.";
		}
		
		/**
		 * 
		 * Constructor
		 * 
		 */
		public function MethodNameFilter( methodNames:Array ) {
			super();
			
			if ( methodNames == null ) {
				throw new TypeError( "You must provide an array of Method Names to the MethodNameFilter" );
			}
			this.methodNames = methodNames;
		}
	}
}