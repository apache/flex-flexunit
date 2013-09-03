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
package org.flexunit.token {
	/**
	 * Interface describing viable tokens to be passed between test stages
	 *  
	 * @author mlabriola
	 * 
	 */
	public interface IAsyncTestToken {

		/**
		 * Returns the parentToken of the <code>AsyncTestToken</code>.
		 */		
		function get parentToken():IAsyncTestToken;
		function set parentToken( value:IAsyncTestToken ):void;
		
		/**
		 * Adds a notification <code>method</code> to the <code>AsyncTestToken</code> and returns the token.
		 * 
		 * @param method A <code>Function</code> that will be invoked when results are sent.
		 * @param debugClassName The name of the class.
		 * 
		 * @return this <code>AsyncTestToken</code> with the added <code>method</code>.
		 */
		function addNotificationMethod( method:Function, debugClassName:String=null ):IAsyncTestToken;
		
		/**
		 * If any notification methods exist, invokes the notification methods with a <code>ChildResult</code> that
		 * contains a references to this token and the provided <code>error</code>.
		 * 
		 * @parameter error The error to be provided to the <code>ChildResult</code>.
		 */
		function sendResult( error:Error=null ):void; 
	}
}