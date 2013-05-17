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