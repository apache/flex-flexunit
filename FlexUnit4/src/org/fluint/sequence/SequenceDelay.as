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

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * A sequence step that delays the sequence for a given time period.
	 * 
  	 * @author Jurgen Failenschmid
     * @see http://code.google.com/p/fluint/wiki/Sequences Test sequences 
	 */
	public class SequenceDelay extends SequenceWaiter {
		
		/**
		 * @private 
		 */
		private var _waitTimer:Timer;
		
		/**
		 * Creates an instance.
		 * 
		 * @param milliseconds the delay time in ms
		 */ 
		public function SequenceDelay(milliseconds:Number = 1000) {
            _waitTimer = new Timer(milliseconds, 1);
			// the timeout shall never happen
			super(_waitTimer, TimerEvent.TIMER_COMPLETE, milliseconds + 900000);
		}

        /** @inheritDoc */
        public override function setupListeners(testCase:*, sequence:SequenceRunner):void {
        	super.setupListeners(testCase, sequence);
        	_waitTimer.start();
        }
        
        /**
         * Factory method for an instance with a delay expressed in seconds.
         * 
         * @param seconds delay in seconds
         * @return an instance ready to be added to a sequence
         */ 
        public static function forSeconds(seconds:Number):SequenceDelay {
        	return new SequenceDelay(1000 * seconds);
        }
	}
}