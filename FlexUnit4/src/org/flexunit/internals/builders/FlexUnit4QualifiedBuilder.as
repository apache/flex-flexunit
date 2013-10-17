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
	import flex.lang.reflect.Klass;
	import flex.lang.reflect.Method;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.TestClass;

	/**
	 *
	 * This class is used as an alternate builder for FlexUnit 4. Normally FlexUnit4 is the default
	 * builder, so it accepts all classes. In this class we determine if it is actually a FlexUnit 4
	 * test
	 *  
	 * @author mlabriola
	 * 
	 */
	public class FlexUnit4QualifiedBuilder extends FlexUnit4Builder {
		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			var klassInfo:Klass = new Klass( testClass );
			var found:Boolean = false;
			
			var methods:Array = new Array();
			methods = klassInfo.methods;

			var arrayLen:int = methods.length;
			
			for(var i:int = 0; i < arrayLen; i++) {
				if ( (methods[i] as Method).hasMetaData( AnnotationConstants.TEST ) ) {
					found = true;
					break;
				}
			}

			return found;
		}
	}
}