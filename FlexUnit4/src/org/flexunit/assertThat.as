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
package org.flexunit
{
	import org.hamcrest.assertThat;
	
	/**
	 * Creates a hamcrest style assertion using assertThat
	 * 
	 * @param ...rest Rest may specify any values to be tested. It must include
	 * 		a left and a right value as well as at least one matcher.  An error message
	 * 		may also be passed if passed as the first argument.
	 * 
	 * 
	 * @example
	 * <listing version="3.0">
	 * 		assertThat( "3 is usually 3", 3, equals( 4 ) );
	 * </listing>
	 */
	public function assertThat( ...rest ):void {
		Assert.assertWithApply( org.hamcrest.assertThat, rest );
		//org.hamcrest.assertThat.apply( null, rest );
	}
}