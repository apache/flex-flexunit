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
package org.flexunit.experimental.theories.cases
{
	import org.flexunit.Assert;
	import org.flexunit.experimental.theories.PotentialAssignment;

	public class PotentialAssignmentCase
	{
		protected var potentialAssignment:PotentialAssignment;
		protected var name:String;
		protected var value:Object;
		
		[Before(description="Create an instance of the PotentialAssignment class")]
		public function createPotentialAssignment():void {
			name = "testName";
			value = new Object();
			
			potentialAssignment = new PotentialAssignment(name, value);
		}
		
		[After(description="Remove the reference to the PotentialAssignment class")]
		public function destroyPotentialAssignment():void {
			potentialAssignment = null;
			value = null;
			name = null;
		}
		
		[Test(description="Ensure that the forValue function correctly creates an instance of the PotentialAssignment class")]
		public function forValueTest():void {
			var generatedPotentialAssignment:PotentialAssignment = PotentialAssignment.forValue(name, value);
			Assert.assertEquals( name, generatedPotentialAssignment.name );
			Assert.assertEquals( value, generatedPotentialAssignment.value );
		}
		
		[Test(description="Ensure that the PotentialAssignment constructor correctly assigns the parameters to the proper class variables")]
		public function potentialAssignmentConstructorTest():void {
			Assert.assertEquals( name, potentialAssignment.name);
			Assert.assertEquals( value, potentialAssignment.value );
		}
		
		[Test(description="Ensure that the getValue function correctly returns the value")]
		public function getValueTest():void {
			Assert.assertEquals( value, potentialAssignment.getValue() );
		}
		
		[Test(description="Ensure that the getDescription function correctly returns the name")]
		public function getDescriptionTest():void {
			Assert.assertEquals( name, potentialAssignment.getDescription() );
		}
		
		[Test(description="Ensure that the toString method returns the correct string value")]
		public function toStringTest():void {
			Assert.assertEquals( name + ' ' + "[" + String( value ) + "]", potentialAssignment.toString() );
		}
	}
}