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
package org.flexunit.runner.manipulation.sortingInheritance {
	import org.flexunit.runner.IDescription;

	/**
	 * Interface for caching implementation that will allow querying of the inheritance order of a given method
	 * relative to its definition super and subclasses
	 *  
	 * @author mlabriola
	 * 
	 */	
	public interface ISortingInheritanceCache {
		/**
		 * Returns the ordering of this item with respect to its inheritance hierarchy 
		 * @param description
		 * @param superFirst
		 * @return 
		 * 
		 */		
		function getInheritedOrder( description:IDescription, superFirst:Boolean = true ):int;
	}
}