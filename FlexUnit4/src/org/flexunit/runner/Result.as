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
package org.flexunit.runner {
	import org.flexunit.internals.namespaces.classInternal;
	import org.flexunit.runner.notification.RunListener;
	
	use namespace classInternal;

	/**
	 * A <code>Result</code> collects and summarizes information from running multiple
	 * tests. Since tests are expected to run correctly, successful tests are only noted in
	 * the count of tests that ran.
	 */
	public class Result {
		/**
		 * The number of tests run.
		 */
		classInternal var _runCount:int = 0;
		/**
		 * The number of tests ignored.
		 */
		classInternal var _ignoreCount:int = 0;
		/**
		 * The number of milliseconds it took to run the entire set of tests.
		 */
		classInternal var _runTime:Number = 0;
		/**
		 * The time when the test run started.
		 */
		classInternal var _startTime:Number;
		
		/**
		 * @private
		 */
		private var _failures:Array = new Array()
		
		/**
		 * Returns the number of tests that failed over the course of the run.
		 */
		public function get failureCount():int {
			return failures.length;
		}

		/**
		 * Returns the <code>Failure</code>s describing tests that failed and the problems they encountered.
		 */
		public function get failures():Array {
			return _failures;
		}

		/**
		 * Returns the number of tests ignored over the course of the run.
		 */
		public function get ignoreCount():int {
			return _ignoreCount;
		}

		/**
		 * Returns the number of tests that have run.
		 */
		public function get runCount():int {
			return _runCount;
		}

		/**
		 * Returns the number of milliseconds it took to run the entire set of tests.
		 */
		public function get runTime():Number {
			return _runTime;
		}

		/**
		 * Returns a Boolean value of <code>true</code> if all tests succeeded.
		 */
		public function get successful():Boolean {
			return ( failureCount == 0 );
		}
		
		/**
		 * Internal use only.
		 */
		public function createListener():RunListener {
			var listener:Listener = new Listener();;
			listener.result = this;
			return listener;
		}
		
		/**
		 * Constructor.
		 */
		public function Result() {
		}
	}
}

import flash.utils.getTimer;

import flexunit.framework.Assert;

import org.flexunit.Assert;
import org.flexunit.internals.namespaces.classInternal;
import org.flexunit.runner.Description;
import org.flexunit.runner.IDescription;
import org.flexunit.runner.Result;
import org.flexunit.runner.notification.Failure;
import org.flexunit.runner.notification.RunListener;

use namespace classInternal;

class Listener extends RunListener {
	protected var ignoreDuringExecution:Boolean = false;
	
	override public function testRunStarted( description:IDescription ):void {
		result._startTime = getTimer();
	}

	override public function testRunFinished( result:Result ):void {
		var endTime:Number = getTimer();
		result._runTime += endTime - result._startTime;
	}

	override public function testFinished( description:IDescription ):void {
		if (!ignoreDuringExecution) {
			result._runCount++;
		}
		
		ignoreDuringExecution = false;
	}

	override public function testFailure( failure:Failure ):void {
		result.failures.push( failure );
	}

	override public function testIgnored( description:IDescription ):void {
		result._ignoreCount++;
		ignoreDuringExecution = false;
	}
	
	override public function testStarted( description:IDescription ):void {
		org.flexunit.Assert.resetAssertionsFields();
		flexunit.framework.Assert.resetAssertionsMade();
	}	
}