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
	
	/**
	 * An <code>IDescription</code> class that is being used in a test run. An <code>IDescription</code>
	 * can be atomic (a single test) or compound (containing children tests).  <code>IDescription</code>s 
	 * are used to provide feedback about the tests that are about to run (for example, the tree view 
	 * visible in many IDEs) or tests that have been run (for example, the failures view).
	 * This information can be used to report the current progress of the test run.<br/>
	 */
	public interface IDescription {
		/**
		 * @return a list of the receiver's children, if any exists.
		 */
		function get children():Array;
		/**
		 * @return a user-understandable label.
		 */
		function get displayName():String;
		/**
		 * @return <code>true</code> if the receiver is a suite.
		 */
		function get isSuite():Boolean;
		/**
		 * @return <code>true</code> if the receiver is an atomic test.
		 */
		function get isTest():Boolean;
		/**
		 * @return the total number of atomic tests in the receiver.
		 */
		function get testCount():int;

		/**
		 * Returns the metadata node that is attached to this description if a node is found with a matching <code>type</code> 
		 * or a value of <code>null</code> if no such node exists.
		 * 
		 * @param type The name of the node to find in the description's metadta.
		 * 
		 * @return the metadata node that is attached to this description if a node is found with a matching <code>type</code> 
		 * or a value of <code>null</code> if no such node exists.
		 */
		//function getMetadata( type:String ):MetaDataAnnotation;
		/**
		 * Returns all of the metadata that is attached to this description node.
		 * 
		 * @return the metadata as XML that is attached to this description node, 
		 * or null if none exists
		 */
		function getAllMetadata():Array;
		/**
		 * @return <code>true</code> if the receiver is an instance
		 */
		function get isInstance():Boolean;
		/**
		 * @return true if this is a description of a Runner that runs no tests
		 */
		function get isEmpty():Boolean;

		/**
		 * Adds an <code>IDescription</code> as a child of the receiver.
		 * 
		 * @param description the soon-to-be child.
		 */
		function addChild( description:IDescription ):void;		
		/**
		 * Returns a copy of this description, with no children (on the assumption that some of the
		 * children will be added back).
		 * 
		 * @return a copy of this description, with no children (on the assumption that some of the
		 * children will be added back).
		 */
		function childlessCopy():IDescription;
		/**
		 * Determines if the current description is equal to the provided <code>obj</code>.
		 * 
		 * @param obj The object to check against the current description.
		 * 
		 * @return true if this is a description of a Runner that runs no tests
		 */
		function equals( obj:Object ):Boolean;
	}
}