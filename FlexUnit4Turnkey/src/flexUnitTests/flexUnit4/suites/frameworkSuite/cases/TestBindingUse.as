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
package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import flash.events.Event;
	
	import flexUnitTests.flexUnit4.suites.frameworkSuite.cases.valueObject.Person;
	
	import org.flexunit.Assert;
	import org.fluint.sequence.SequenceBindingWaiter;
	import org.fluint.sequence.SequenceRunner;
	import org.fluint.sequence.SequenceSetter;

    /**
     * @private
     */
	public class TestBindingUse {
		protected static var SHORT_TIME:int = 50;

		protected var person:Person;
		
		[Before]
		public function setUp():void {
			person = new Person();
		}
		
		[After]
		public function tearDown():void {
			person = null;
		}

		[Test(async)]
	    public function testSetPropertySuccess() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.firstName = 'mike';
	    	passThroughData.lastName = 'labriola';

			//set firstName, listen for firstName change
			//set lastName, listen for lastName change
	    	var sequence:SequenceRunner = new SequenceRunner( this );
	    	
	    	with ( sequence ) {
				addStep( new SequenceSetter( person, {firstName:passThroughData.firstName} ) );
				addStep( new SequenceBindingWaiter( person, 'firstName', SHORT_TIME ) );
	
				addStep( new SequenceSetter( person, {lastName:passThroughData.lastName} ) );
				addStep( new SequenceBindingWaiter( person, 'lastName', SHORT_TIME ) );
				
				addAssertHandler( handlePropertySetEvent, passThroughData );
				
				run();	    		
	    	}
	    }

		[Test(async)]
	    public function testSetNonPropertyChangeEventProperty() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.age = 400;

			//set firstName, listen for firstName change
			//set lastName, listen for lastName change
	    	var sequence:SequenceRunner = new SequenceRunner( this );

	    	with ( sequence ) {
				addStep( new SequenceSetter( person, {age:passThroughData.age} ) );
				addStep( new SequenceBindingWaiter( person, 'age', SHORT_TIME ) );
				
				addAssertHandler( handlePropertySetEvent, passThroughData );
				
				run();
	    	}
	    }

		//This test case is valid, but I need to find a way to test it within the right context
		[Test(async)]
	    public function testSetPropertyFail() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.firstName = 'mike';
	    	passThroughData.lastName = 'labriola';

			//This time we set the firstName property but wait for the lastName
	    	var sequence:SequenceRunner = new SequenceRunner( this );

			with ( sequence ) {
				addStep( new SequenceSetter( person, {firstName:passThroughData.firstName} ) );
				addStep( new SequenceBindingWaiter( person, 'firstName', SHORT_TIME ) );

				addStep( new SequenceSetter( person, {firstName:passThroughData.lastName} ) );
				addStep( new SequenceBindingWaiter( person, 'lastName', SHORT_TIME, handlePropertyShouldFailTimeOut ) );

				addAssertHandler( handleShouldNotGetHere, passThroughData );
			
				run();
			}
	    }

		[Test(async)]
	    public function testLastNameTimeOut() : void {
	    	var passThroughData:Object = new Object();
	    	passThroughData.firstName = 'mike';
	    	passThroughData.lastName = 'labriola';

			//This time we set the firstName property but wait for the lastName
	    	var sequence:SequenceRunner = new SequenceRunner( this );

			with ( sequence ) {
				addStep( new SequenceSetter( person, {firstName:passThroughData.firstName} ) );
				addStep( new SequenceBindingWaiter( person, 'firstName', SHORT_TIME ) );

				//addStep( new SequenceSetter( person, {firstName:passThroughData.lastName} ) );
				addStep( new SequenceBindingWaiter( person, 'lastName', SHORT_TIME, handlePropertyShouldFailTimeOut ) );

				addAssertHandler( handleShouldNotGetHere, passThroughData );
			
				run();
			}
	    }

	    protected function handlePropertySetEvent( event:Event, passThroughData:Object ):void {
	    	//trace("Property Changed Event Occurred " + event.type );
	    	Assert.assertEquals( passThroughData.firstName, event.target.firstName );
	    }

	    protected function handleShouldNotGetHere( event:Event, passThroughData:Object ):void {
	    	Assert.fail( "Test should have timed out");
	    }
	    
	    protected function handlePropertyShouldFailTimeOut( passThroughData:Object ):void {
	    	//Property timed out correctly
	    }
	}
}