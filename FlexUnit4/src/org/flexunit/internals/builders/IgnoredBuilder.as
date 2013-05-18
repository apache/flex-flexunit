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
	
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.runner.IRunner;
	import org.flexunit.runners.model.RunnerBuilderBase;
	
	/**
	 * The <code>IgnoredBuilder</code> potentially builds an <code>IgnoredClassRunner</code> for
	 * a provided testClass.  It is determined whether the testClass is marked as being ignored with
	 * a metadata tag ([Ignore]).  If this is the case, a <code>IgnoredClassRunner</code> is created for the test 
	 * class; however, if it does not fulfill this criteria, no <code>IRunner</code> will be generated.
	 */
	public class IgnoredBuilder extends RunnerBuilderBase {

		/**
		 * @inheritDoc
		 */
		override public function canHandleClass(testClass:Class):Boolean {
			var klassInfo:Klass = new Klass( testClass );
			
			//If the klassInfo has ignore metadata, the test class should be ignored
			if ( klassInfo.hasMetaData( AnnotationConstants.IGNORE ) )
				return true;
			
			return false;
		}
		
		/**
		 * Returns a <code>IgnoredClassRunner</code> if the <code>testClass</code> has an [Ignore] metadata tag.
		 * 
		 * @param testClass The class to check.
		 * 
		 * @return a <code>IgnoredClassRunner</code> if the <code>testClass</code> has an [Ignore] metadata tag; 
		 * otherwise, a value of <code>null</code> is returned.
		 */
		override public function runnerForClass( testClass:Class ):IRunner {
			return new IgnoredClassRunner(testClass);
		}
	}
}