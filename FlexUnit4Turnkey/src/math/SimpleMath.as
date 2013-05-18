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
package math {
	public class SimpleMath {
		public function add( n1:Number, n2:Number ):Number {
			return (n1+n2);
		}

		public function subtract( n1:Number, n2:Number ):Number {
			return (n1-n2);
		}

		public function multiply( n1:Number, n2:Number ):Number {
			return (n1*n2);
		}

		public function divide( n1:Number, n2:Number ):Number {
			if ( n2 == 0 ) {
				throw new TypeError("Cannot divide by 0");
			}
			return (n1/n2);
		}
	}
}