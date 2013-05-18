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
package org.flexunit.internals.builders
{
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>NullBuilder</code> does not build an <code>IRunner</code>.  Instead, it provides a value
	 * of <code>null</code> as the <code>IRunner</code>.  The <code>NullBuilder</code> is typically used
	 * if another builder cannot be used at the present time.
	 * 
	 * The <code>AllDefaultPossibilitiesBuilder</code> uses this builder when other builders cannot be used
	 * under certain conditions (ex: AS only project).
	 * 
	 * @see org.flexunit.internals.builders.AllDefaultPossibilitiesBuilder#fluint1Builder()
	 */
	public class NullBuilder extends RunnerBuilderBase
	{
		/**
		 * Constructor.
		 */
		public function NullBuilder()
		{
			super();
		}
		
	}
}