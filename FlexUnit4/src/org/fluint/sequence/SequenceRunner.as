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
	import flash.events.Event;
	
	/**
     * Allows developer to add a series of steps, execute those steps 
	 * in order, until the sequence is complete.
     */	
	public class SequenceRunner	{
		/**
		 * @private
		 */
		protected var testCase:*;

		/**
		 * @private
		 */
		protected var steps:Array;

		/**
		 * @private
		 */
		protected var assertHandlers:Array;
		
		/**
		 * @private
		 */
		protected var currentStep:int = 0;
		
		/**
		 * @private
		 */
		protected var _executingStep:ISequenceStep;

		/**
		 * @private
		 */
		protected var _pendingStep:ISequencePend;

		/**
		 * Returns number of steps in the sequence.
		 */
		public function get numberOfSteps():int {
			return steps.length;
		}

		/**
		 * Returns the ISequenceStep at a specified index.
		 */
		public function getStep( stepIndex:int ):ISequenceStep {
			return steps[ stepIndex ];
		}

		/**
		 * Returns the ISequenceStep currently executing.
		 */
		public function getExecutingStep():ISequenceStep {
			return _executingStep;
		}

		/**
		 * Returns the ISequenceStep currently executing.
		 */
		public function getPendingStep():ISequencePend {
			return _pendingStep;
		}

		/**
		 * Adds an ISequenceStep to the sequence.
		 * 
		 * @param step Step to be added.
		 */
		public function addStep( step:ISequenceStep ):void {
			steps.push( step );
		}

		/** 
	 	 * <p>
	 	 * Add a reference to the event handler that should be called if the sequence completes 
	 	 * sucessfully.</p>
	 	 * 
	 	 * <p>
	 	 * The handler is expected to have the follow signature:</p>
	 	 * 
	 	 * <p>
	 	 * <code>public function handleEvent( event:Event, passThroughData:Object ):void {
	 	 * }</code></p>
	 	 * 
		 * @param assertHandler The original event object from the previous step.
		 * @param passThroughData A generic object that can optionally be provided by 
	 	 * the developer when creating a new sequence.
		 */
		public function addAssertHandler( assertHandler:Function, passThroughData:Object ):void {
			assertHandlers.push( new AssertHandler( assertHandler, passThroughData ) );
		}

		/**
		 * Begins the execution of a sequence.
		 */
		public function run():void {
			continueSequence( null );
		}

		/**
		 * @private
		 */
		protected function applyActions( actions:Array ):void {
			for ( var i:int=0;i<actions.length; i++ ) {
				_executingStep = actions[ i ] as ISequenceStep; 
				( actions[ i ] as ISequenceAction ).execute();
			}
		}
		
		/**
		 * @private
		 */
		protected function applyHandlers( event:Event ):void {
			var handler:AssertHandler;

			for ( var i:int=0;i<assertHandlers.length; i++ ) {
				handler = ( assertHandlers[ i ] as AssertHandler ); 
				handler.assertHandler( event, handler.passThroughData ); 
			}
			
			//sequenceComplete = true;
		}

		/**
		 * Called by the testCase when the next step in the sequence should begin.
		 * 
		 * @param event Event broadcast by the last step in the sequence.
		 */
		public function continueSequence( event:Event ):void {
			var actionArray:Array = new Array();
			var nextPend:ISequencePend;
			var scheduledNewAsync:Boolean = false;


			//Look forward into the sequence until we find the next time we need to pend
			while( currentStep < numberOfSteps ) {
				if ( steps[ currentStep ] is ISequencePend ) {
					nextPend = steps[ currentStep ] as ISequencePend;
					currentStep++; 
					break;
				} else {
					//Keep an array of the actions we need to take
					actionArray.push( steps[ currentStep ] );
					currentStep++; 
				}
			}

			if ( nextPend ) {
				_pendingStep = nextPend; 
				nextPend.setupListeners( testCase, this );
				scheduledNewAsync = true;
			}
			
			applyActions( actionArray );
			
			
			if ( ( currentStep >= numberOfSteps ) && ( !scheduledNewAsync ) ) {
				applyHandlers( event );
			}
		}

		/**
		 * Constructor.
		 *  
		 * @param testCase testCase within which is sequence is being run.
		 */
		public function SequenceRunner( testCase:* ) {
			steps = new Array();
			assertHandlers = new Array();

			this.testCase = testCase;
		}		
	}
}

////////////////////////////////////////////////////////////////////////////////
//
//  Helper class: AssertHandler
//
////////////////////////////////////////////////////////////////////////////////
class AssertHandler
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------
	public function AssertHandler( assertHandler:Function, passThroughData:Object=null )
    {
		super();

		this.assertHandler = assertHandler;
		this.passThroughData = passThroughData;
    }

	/** 
	 * <p>
	 * A reference to the event handler that should be called if the sequence completes 
	 * sucessfully.</p>
	 * 
	 * <p>
	 * The handler is expected to have the follow signature:</p>
	 * 
	 * <p>
	 * <code>public function handleEvent( event:Event, passThroughData:Object ):void {
	 * }</code></p>
	 * 
	 * <p>
	 * The first parameter is the original event object from the previous step.
	 * The second parameter is a generic object that can optionally be provided by 
	 * the developer when creating a new sequence.</p>
	 */
    public var assertHandler:Function;
    /**
    * Description of variable
    */
    public var passThroughData:Object ;
}
