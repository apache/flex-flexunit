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
	import flash.utils.Dictionary;
	
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	
	import org.flexunit.runner.IDescription;
	import org.flexunit.runners.model.TestClass;
	import org.flexunit.utils.DescriptionUtil;
	
	/**
	 * ISortingInheritanceCache implementation that will allow querying of the inheritance order of a given method
	 * relative to its definition super and subclasses
	 *  
	 * @author mlabriola
	 * 
	 */	
	public class ClassInheritanceOrderCache implements ISortingInheritanceCache {
		/**
		 * @private 
		 */		
		private var superFirst:Boolean = true;
		/**
		 * @private 
		 */		
		private var testClass:TestClass;
		/**
		 * @private 
		 */		
		private var superIndexMap:Dictionary;
		/**
		 * @private 
		 */		
		private var klassInfo:Klass;

		/**
		 * @private 
		 */		
		private var maxInheritance:int;
		
		/**
		 * @private
		 * 
		 * This is ugly and needs to be refactored. I think we need to modify description
		 * to accomplish what I want, but I need to fix this for the moment 
		 */		
		private function returnOnlyName( description:IDescription ):String {
			return DescriptionUtil.getMethodNameFromDescription( description );
		}

		/**
		 * Returns the order of this method description relative to others in the super/subclasses 
		 * @param description
		 * @param superFirst
		 * @return 
		 * 
		 */
		public function getInheritedOrder( description:IDescription, superFirst:Boolean = true ):int {
			var method:Method = klassInfo.getMethod( returnOnlyName( description ) );
			var index:int = superIndexMap[ method.declaringClass ];
			
			if ( !superFirst ) {
				index = maxInheritance - index;
			}
			
			return index;
		}

		/**
		 * @private 
		 */		
		private function buildMap( testClass:TestClass ):Dictionary {
			var dict:Dictionary = new Dictionary( true );
			
			var inheritance:Array = klassInfo.classInheritance;
			
			maxInheritance = inheritance.length;
			
			dict[ testClass.asClass ] = 0;

			for ( var i:int=0; i<inheritance.length; i++ ) {
				dict[ inheritance[ i ] ] = i + 1;
			}
			
			return dict;
		}
		
		/**
		 * Builds a map of the class inheritance for a given testclass
		 *  
		 * @param testClass
		 * 
		 */		
		public function ClassInheritanceOrderCache( testClass:TestClass ) {
			this.testClass = testClass;
			this.klassInfo = testClass.klassInfo;
			
			superIndexMap = buildMap( testClass );
		}
	}
}