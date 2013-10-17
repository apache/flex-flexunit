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
	import org.flexunit.internals.builders.OnlyRecognizedTestClassBuilder;
	import org.flexunit.runner.Request;
	
	/**
	 * A QualifyingRequest is a request that verifies each class passed to it is in fact a viable
	 * test before attempting to include it.
	 *  
	 * @author mlabriola
	 * 
	 */
	public class QualifyingRequest extends Request {
		/**
		 * Constructor 
		 * 
		 */
		public function QualifyingRequest() {
			super();
		}

		/**
		 *  
		 * @param argumentsArray possible test classes to be included in a Request
		 * @return a Request composed of all the arguments which could be identified as runnable tests
		 * 
		 */
		public static function classes( ...argumentsArray ):Request {
			var allQualifiedBuilders:OnlyRecognizedTestClassBuilder = new OnlyRecognizedTestClassBuilder(true);
			var arrayLen:int = argumentsArray.length;
			var modifiedArray:Array = new Array();
			
			//Loop through array of classes and determine
			//if the classes are valid test case classes
			//If they are not, then remove them from the array			
			for(var i:int = 0; i<arrayLen; i++) {
				//if allqualifiedbuilders.qualify returns true, we've found
				//a builder so add the class to the modified array
				if ( ( allQualifiedBuilders.qualify(argumentsArray[i] ) ) )
					modifiedArray.push(argumentsArray[i]);				
			}
			
			//Take Arguments Array length minus the modified Array length
			//this will give us the number of files skipped
			//To Do: Somehow display this variable to the user
			//var totalFilesSkipped:int = arrayLen - modifiedArray.length;
			
			//Build out builders for every qualified testcase in the array
			return Request.classes.apply( null, modifiedArray );  
		}
	}
}