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
package flex.lang.reflect.metadata {

	/**
	 * An object representing an argument of a metadata tag, in the example [Test(arg="1")]
	 * arg="1" is the argument. You can interrogate the arguments key and value. 
	 */
	public class MetaDataArgument {
		/**
		 * @private
		 */
		private var argument:XML;
		/**
		 * @private
		 */
		private var _key:String;
		/**
		 * @private
		 */
		private var _value:String;

		/**
		 * @private
		 */
		private var _unpaired:Boolean = false;
		
		/**
		 * Retrieves the key of an argument. Read Only. (The name of a name/value pair.)
		 * @return 
		 * 
		 */
		public function get key():String {
			return _key;
		}
		
		/**
		 * Retrieves the value portion of an argument. Read Only. (The value of a name/value pair.)
		 * 
		 * @return Returns the string of the value of the argument.
		 * 
		 */
		public function get value():String {
			return _value;
		}

		/**
		 * Indicates if the argument is unpaired. Given the following example:
		 * 
		 * [RunWith("org.flexunit.runners.Suite",order=1)]
		 * 
		 * order="1" is a paired argument where as "org.flexunit.runners.Suite" is unpaired. 
		 * 
		 * @return true if unpaired
		 * 
		 */
		public function get unpaired():Boolean {
			return _unpaired;
		}

		/**
		 * Compares two MetaDataArguments for key and value equality
		 * 
		 * @return Returns boolean indicating equality
		 * 
		 */
		public function equals( item:MetaDataArgument ):Boolean {
			return ( this.key == item.key && this.value == item.value );
		}

		/**
		 * Constructor
		 * Parses <arg/> nodes returned from a call to <code>describeType</code> to provide an object wrapper. 
		 * Expected format of the argument is
		 * 
		 * <arg key="someKey" value="someValue"/>
		 * 
		 * @param An <arg/> XML node.
		 * 
		 */
		public function MetaDataArgument( argumentXML:XML ) {

			if ( !argumentXML ) {
				throw new ArgumentError("Valid XML must be provided to MetaDataArgument Constructor");
			}

			this.argument = argumentXML;

			var potentialKey:String = argument.@key;
			_value = argument.@value;

			if ( potentialKey && potentialKey.length>0 ) {
				_key = potentialKey;
			} else if ( _value && _value.length>0 ){
				_unpaired = true;
				_key = _value;
				_value = "true";
			} else {
				_key = argument.@key;
			}
		}
	}
}
