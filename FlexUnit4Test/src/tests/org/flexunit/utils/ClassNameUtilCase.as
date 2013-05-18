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
package tests.org.flexunit.utils {
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.runner.FlexUnitCore;
	import org.flexunit.utils.ClassNameUtil;

	public class ClassNameUtilCase {
		
		[Test]
		public function shouldReplacePeriods():void {
			var name:String = ClassNameUtil.getLoggerFriendlyClassName( FlexUnitCore );
			
			assertTrue( name.length > 0 );
			assertTrue( name.indexOf( "FlexUnitCore" ) > 0 );
			assertEquals( -1, name.indexOf( "." ) );
		}

		[Test]
		public function shouldReplaceColons():void {
			var name:String = ClassNameUtil.getLoggerFriendlyClassName( FlexUnitCore );
			
			assertTrue( name.length > 0 );
			assertTrue( name.indexOf( "FlexUnitCore" ) > 0 );
			assertEquals( -1, name.indexOf( "::" ) );
		}

		[Test]
		public function shouldReplaceDollarSigns():void {
			var name:String = ClassNameUtil.getLoggerFriendlyClassName( InternalTestClass );
			
			assertTrue( name.length > 0 );
			assertTrue( name.indexOf( "InternalTestClass" ) > 0 );
			assertEquals( -1, name.indexOf( "$" ) );
		}
	}
}

class InternalTestClass {
	
}
