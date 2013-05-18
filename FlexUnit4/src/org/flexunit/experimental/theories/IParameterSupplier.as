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
package org.flexunit.experimental.theories
{
	/**
	 * The <code>IParameterSupplier</code> is an interface used by classes that supply values to parameters for a theory
	 * test method.
	 */
	public interface IParameterSupplier
	{
		/**
		 * Generates an Array containing all possible values that can be associated with a particular <code>sig</code> for
		 * a parameter in a theory test method.
		 * 
		 * @param sig The provided <code>ParameterSignature</code>.
		 * 
		 * @return an Array containing all possible values that can be associated with a particular <code>sig</code> for
		 * a parameter in a theory test method.
		 */
		function getValueSources( sig:ParameterSignature ):Array;	
	}
}