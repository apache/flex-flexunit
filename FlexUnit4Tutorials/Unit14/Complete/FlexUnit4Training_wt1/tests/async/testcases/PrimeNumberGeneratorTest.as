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
package async.testcases
{
	import helper.NumberDataHelper;
	
	import net.digitalprimates.async.PrimeNumberGenerator;
	import net.digitalprimates.event.PrimeGeneratorEvent;
	
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class PrimeNumberGeneratorTest
	{
		private static const TIMEOUT:int = 500;
		
		public static var numberLoader:NumberDataHelper = new NumberDataHelper( "xml/numberList.xml" );
		
		[Parameters(loader="numberLoader")]
		public static var data:Array;
		
		private var primeNumberGenerator:PrimeNumberGenerator;
		
		private var value:Number;
		private var length:Number;
		
		public function PrimeNumberGeneratorTest( value:Number, length:Number )
		{
			this.value = value;
			this.length = length;
		}
		
		[Before( async )]
		public function setup():void {
			primeNumberGenerator = new PrimeNumberGenerator();
			Async.proceedOnEvent( this, primeNumberGenerator, PrimeGeneratorEvent.GENERATOR_READY, TIMEOUT );
			
		}
		
		[After( async )]
		public function tearDown():void {
			primeNumberGenerator = null;
		}
		
		[Test(async)]
		public function shouldCreatePrimeArray():void 
		{
			Async.handleEvent( this, primeNumberGenerator, PrimeGeneratorEvent.GENERATION_COMPLETE, handleComplete, TIMEOUT );
			
			primeNumberGenerator.generatePrimes( value );
		}
		
		protected function handleComplete( event:PrimeGeneratorEvent, passThroughData:Object ):void 
		{
			assertThat( event.primeList.length, equalTo( length ) );
		}
	}
}