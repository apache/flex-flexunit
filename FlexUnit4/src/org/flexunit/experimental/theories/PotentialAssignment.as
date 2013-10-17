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
package org.flexunit.experimental.theories {
	
	/**
	 * A <code>PotentialAssignment</code> stores information for a particular value 
	 * that is assigned to a parameter in a theory method.
	 */
	public class PotentialAssignment implements IPotentialAssignment {
		/**
		 * The value that can be applied to a particular parameter.
		 */
		public var value:Object;
		/**
		 * The name of the variable that is providing the potential value.
		 */
		public var name:String;
		
		/**
		 * Creates a <code>PotentialAssignment</code> for a given name and value.
		 * 
		 * @param name The name of the variable that is providing the potential value.
		 * @param value The value that can be applied to a particular parameter.
		 * 
		 * @return a <code>PotentialAssignment</code>.
		 */
		public static function forValue( name:String, value:Object ):PotentialAssignment {
			return new PotentialAssignment( name, value );
		}
		
		/**
		 * Constructor.
		 * 
		 * @param name The name of the variable that is providing the potential value.
		 * @param value The value that can be applied to a particular parameter.
		 */
		public function PotentialAssignment( name:String, value:Object ) {
			this.name = name;
			this.value = value;
		}
		
		/**
		 * Returns the value of the <code>PotentialAssignment</code>.
		 */
		public function getValue():Object {
			return value;
		}
		
		/**
		 * Returns the name of the variable associated with the <code>PotentialAssignment</code>.
		 */
		public function getDescription():String {
			return name;
		}
		
		/**
		 * Returns a string that includes the name of the parameter the potential assignment is associated with
		 * as well as the value being assigned to the parameter.
		 */
		public function toString():String {
			return name + ' ' + "[" + String( value ) + "]";
		}
	}
}