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
package org.flexunit.utils {
	import org.flexunit.runner.IDescription;

	/**
	 * This is a temporary class to work around parsing name issues with the Description when using parameterized
	 * testing. It is my hope that it can be removed and replaced with a better solution for 4.2 
	 * @author mlabriola
	 * 
	 */	
	public class DescriptionUtil {
		/**
		 *
		 * Returns a method name based on the provided description. In particular reverses the naming process of
		 * the parameterized runner. This class will be removed once description is modified for 4.2
		 *  
		 * @param description
		 * @return 
		 * 
		 */		
		public static function getMethodNameFromDescription( description:IDescription ):String {
			var spaceIndex:int = description.displayName.indexOf( " " );
			var hayStack:String;
			var lastDotIndex:int = 0;
			
			if ( spaceIndex < 0 ) {
				//This is a normal method
				hayStack = description.displayName;
			} else {
				//This is a parameterized method
				hayStack = description.displayName.substr( 0, spaceIndex );
			}
			
			lastDotIndex = hayStack.lastIndexOf( "." );
			
			if ( lastDotIndex < 0 ) {
				return "";
			}
			
			return hayStack.substr( lastDotIndex + 1 );
		}
	}
}