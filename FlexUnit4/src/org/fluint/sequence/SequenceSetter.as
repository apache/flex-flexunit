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
package org.fluint.sequence {
	import flash.events.IEventDispatcher;
	
	/** 
	 * The sequence setter class tells the TestCase instance to set properties on 
	 * the target.
	 */	 
	public class SequenceSetter implements ISequenceAction {
        /**
         * @private
         */
		protected var _target:IEventDispatcher;

        /**
         * @private
         */
		protected var _props:Object;

		/** 
		 * The event dispatcher where the properties/value pairs defined 
		 * in the props object will be set. 
		 */
		public function get target():IEventDispatcher {
			return _target;	
		}

		/** 
		 * <p>
		 * A generic object that contains name/value pairs that should be set on the target.</p>
		 * 
		 * <p>
		 * For example, if the target were a TextInput, a props defined like this: </p>
		 * 
		 * <p><code>{text:'blah',enabled:false}</code></p>
		 * 
		 * <p>
		 * Would set the text property to 'blah' and the enabled property to false.</p>
		 */
		public function get props():Object {
			return _props;
		}

		/**
		 * Sets the name/value pairs defined in the props object to the target.
		 */
		public function execute():void {
			if ( props ) {
				for ( var prop:String in props ) {
					if ( target ) {
						//Set all requested values on this object
						target[ prop ] = props[ prop ];
					}
				}  
			}
		}

		/**
		 * Constructor.
		 *  
		 * @param target The target where properties will be set.
		 * @param props Contains the property/value pairs to be set on the target.
		 */
		public function SequenceSetter( target:IEventDispatcher, props:Object ) {
			_target = target;
			_props = props;
		}
	}
}