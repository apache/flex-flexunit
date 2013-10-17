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
package org.flexunit.internals.requests {
	import org.flexunit.internals.runners.ErrorReportingRunner;
	import org.flexunit.runner.IRequest;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runner.Request;
	import org.flexunit.runner.manipulation.IFilter;
	import org.flexunit.runner.manipulation.NoTestsRemainException;
	import org.flexunit.runner.manipulation.filters.AbstractFilter;

	/**
	 * A <code>Request</code> that filters a test class.
	 */
	public class FilterRequest extends Request {
		/**
		 * @private
		 */
		private var request:IRequest;
		/**
		 * @private
		 */
		private var filter:IFilter;

		/**
		 * Constructor.
		 * 
		 * Creates a filtered Request.
		 * 
		 * @param classRequest An <code>IRequest</code> describing the tests.
		 * @param filter <code>Filter</code> to apply to the tests described in classRequest.
		 */
		public function FilterRequest( classRequest:IRequest, filter:IFilter ) {
			super();
			this.request = classRequest;
			this.filter = filter;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get iRunner():IRunner {
			try {
				var runner:IRunner = request.iRunner;
				filter.apply( runner );
				return runner;
			} catch ( error:NoTestsRemainException ) {
				//TODO: Need to review what exactly is needed here
				return new ErrorReportingRunner( FilterRequest, 
					new Error( "No tests found matching " + filter.describe + " from " + request ) );
								
			}
			
			return null;
		}
	}
}