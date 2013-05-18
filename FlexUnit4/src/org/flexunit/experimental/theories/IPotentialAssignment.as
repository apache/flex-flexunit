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
package org.flexunit.experimental.theories {
	/**
	 * The <code>IPotentialAssignment</code> interface is used by classes that want to store poential values that will
	 * be used by parameters in a theory test method.
	 */
	public interface IPotentialAssignment {
		/**
		 * Returns the value of the <code>PotentialAssignment</code>.
		 */
		function getValue():Object;
		/**
		 * Returns the name of the variable associated with the <code>PotentialAssignment</code>.
		 */
		function getDescription():String;
		/**
		 * Returns a string that includes the name of the parameter the potential assignment is associated with
		 * as well as the value being assigned to the parameter.
		 */
		function toString():String;	
	}
}