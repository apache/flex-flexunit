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
package org.fluint.sequence
{
	import flash.events.IEventDispatcher;

	/**
	 * A sequence step that calls a method
	 *  
	 * @author mlabriola
	 * 
	 */
	public class SequenceCaller implements ISequenceAction
	{
        /**
         * @private
         */
		protected var _target:IEventDispatcher;

        /**
         * @private
         */
		protected var _args:Array;

        /**
         * @private
         */
		protected var _method:Function;

        /**
         * @private
         */
		protected var _argsFunction:Function;

		/** 
		 * The event dispatcher where the properties/value pairs defined 
		 * in the props object will be set. 
		 */
		public function get target():IEventDispatcher {
			return _target;	
		}

		/** 
		 * <p>
		 * A method to be executed when this step occurs </p>
		 * 
		 */
		public function get method():Function {
			return _method;
		}
		/** 
		 * <p>
		 * An array that contains the arguments to the method that will be called</p>
		 * 
		 */
		public function get args():Array {
			return _args;
		}

		/** 
		 * <p>
		 * Function that returns an array of arguments to be passed to the method. When using the args array, each item is evaluated at the time when the step is created. Using the argsFunction, the function is called just before
		 * method invocation, providing a set of arguments that are evaluated during step execution.</p>
		 * 
		 */
		public function get argsFunction():Function {
			return _argsFunction;
		}
		/**
		 * Sets the name/value pairs defined in the props object to the target.
		 */
		public function execute():void {
			var arguments:Array;
			
			if ( args ) {
				arguments = args;
			} else if ( argsFunction != null ) {
				arguments = argsFunction();
			} 
			
			if ( arguments && ( arguments.length > 0 ) ) {
				method.apply( target, arguments );
			} else {
				method.apply( target );
			}
		}

		/**
		 * Constructor.
		 *  
		 * @param target The target object containing method
		 * @param method Method that will be executed when this step is executed.
  		 * @param args Optional parameter that contains an array of arguments that will be passed to this method.
  		 * @param argsFunction Optional function that returns an of arguments to be passed to method. 
 * 		 */
		public function SequenceCaller( target:IEventDispatcher, method:Function, args:Array=null, argsFunction:Function=null ) {
			_target = target;
			_method = method;
			_args = args;
			_argsFunction = argsFunction;
		}
	}
}