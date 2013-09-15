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
package net.digitalprimates.async
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.digitalprimates.event.PrimeGeneratorEvent;
	
	//This class is only meant for testing. It calcualtes the primes for a number less than 1008.
	public class PrimeNumberGenerator extends EventDispatcher
	{
		private var primes:Array;
		private var constructorTimer:Timer;
		
		public function PrimeNumberGenerator()
		{
			constructorTimer = new Timer( 250, 1 );
			constructorTimer.addEventListener(TimerEvent.TIMER_COMPLETE, constructionComplete, false, 0, true);
			constructorTimer.start();
		}
		
		private function constructionComplete( event:TimerEvent ):void {
			constructorTimer = null;
			
			dispatchEvent( new PrimeGeneratorEvent( PrimeGeneratorEvent.GENERATOR_READY, null ) );
		}
		
		public function generatePrimes( value:Number ):void {
			if( value > 1008 )
			{
				throw new RangeError( "Invalid Number: This generator only generates primes less than 1009" );
			}
			
			primes = new Array();
			
			for( var i:int = 0; i < primeList.length; i++ ) {
				if( primeList[ i ] <= value ) {
					primes.push( primeList[ i ] );
				}
				else {
					break;
				}
			}
			
			dispatchEvent( new PrimeGeneratorEvent( PrimeGeneratorEvent.GENERATION_COMPLETE, primes ) );
		}
		
		private var primeList:Array = [ 
			2,      3,      5,      7,      11,     13,     17,     19,     23,     29, 
			31,     37,     41,     43,     47,     53,     59,     61,     67,     71, 
			73,     79,     83,     89,     97,     101,    103,    107,    109,    113, 
			127,    131,    137,    139,    149,    151,    157,    163,    167,    173, 
			179,    181,    191,    193,    197,    199,    211,    223,    227,    229, 
			233,    239,    241,    251,    257,    263,    269,    271,    277,    281, 
			283,    293,    307,    311,    313,    317,    331,    337,    347,    349, 
			353,    359,    367,    373,    379,    383,    389,    397,    401,    409, 
			419,    421,    431,    433,    439,    443,    449,    457,    461,    463, 
			467,    479,    487,    491,    499,    503,    509,    521,    523,    541, 
			547,    557,    563,    569,    571,    577,    587,    593,    599,    601, 
			607,    613,    617,    619,    631,    641,    643,    647,    653,    659, 
			661,    673,    677,    683,    691,    701,    709,    719,    727,    733, 
			739,    743,    751,    757,    761,    769,    773,    787,    797,    809, 
			811,    821,    823,    827,    829,    839,    853,    857,    859,    863, 
			877,    881,    883,    887,    907,    911,    919,    929,    937,    941, 
			947,    953,    967,    971,    977,    983,    991,    997 ]
	}
}