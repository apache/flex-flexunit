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
package flexUnitTests.flexUnit1.framework
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   import flexunit.framework.AssertionFailedError;
   import flexunit.framework.EventfulTestCase;
   
   public class TestEventfulTestCase extends EventfulTestCase
   {      
      public function TestEventfulTestCase( name : String = null )
      {
         super( name );
      }
      
      override public function setUp() : void
      {
      	eventDispatcher = new EventDispatcher();
      }
            
      public function testAssertEventsExpected() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
            
         assertEvents();
   	}

      public function testListenForMultipleEventsExpected() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         listenForEvent( eventDispatcher, "eventName2" );
                    
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
         eventDispatcher.dispatchEvent( new Event( "eventName2" ) );
            
         assertEvents();
   	}
   	
       public function testListenForMultipleEventsExpectedDispatchedInDifferentOrder() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         listenForEvent( eventDispatcher, "eventName2" );
                    
         eventDispatcher.dispatchEvent( new Event( "eventName2" ) );
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
            
         assertEvents();
   	}  	
   	
      public function testAssertEventsNotExpected() : void
   	{
         listenForEvent( eventDispatcher, "eventName", EVENT_UNEXPECTED );           
         eventDispatcher.dispatchEvent( new Event( "differentEventName" ) );
            
         assertEvents();
   	}

      public function testAssertEventsExpectedAndNotExpected() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         listenForEvent( eventDispatcher, "eventName2", EVENT_UNEXPECTED );     
               
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
            
         assertEvents();
   	}

      public function testAssertEventsExpectedAndNotExpectedWithOtherEventsDispatched() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         listenForEvent( eventDispatcher, "eventName2", EVENT_UNEXPECTED );     
               
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
         eventDispatcher.dispatchEvent( new Event( "differentEventName" ) );
            
         assertEvents();
   	}
   	
   	public function testGetDispatchedExpctedEvents() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         listenForEvent( eventDispatcher, "eventName2" );           
         listenForEvent( eventDispatcher, "eventName3", EVENT_UNEXPECTED );     
         
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
         eventDispatcher.dispatchEvent( new Event( "eventName2" ) );
         eventDispatcher.dispatchEvent( new Event( "differentEventName" ) );
            
         assertEvents();
         
         assertEquals( 2, dispatchedExpectedEvents.length );         
   	}
   	
   	public function testGetLastDispatchedExpctedEvents() : void
   	{
         listenForEvent( eventDispatcher, "eventName" );           
         listenForEvent( eventDispatcher, "eventName2" );           
         listenForEvent( eventDispatcher, "eventName3", EVENT_UNEXPECTED );     
         
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
         eventDispatcher.dispatchEvent( new Event( "eventName2" ) );
         eventDispatcher.dispatchEvent( new Event( "differentEventName" ) );
            
         assertEvents();
         
         assertEquals( "eventName2", lastDispatchedExpectedEvent.type );
         
   	}
   	
      public function testAssertEventsExpectedNoDispatch() : void
   	{
   		try
   		{
         	listenForEvent( eventDispatcher, "eventName" );           

         	assertEvents();         	
     		}
     		catch ( e : AssertionFailedError )
     		{
     			return;
     		}	
         fail ( "Should have throw an AssertionFailedError" );
   	}

      public function testAssertEventsExpectedWrongDispatch() : void
   	{
   		try
   		{
         	listenForEvent( eventDispatcher, "eventName" );           
         	listenForEvent( eventDispatcher, "eventName2", EVENT_UNEXPECTED );           
            
         	eventDispatcher.dispatchEvent( new Event( "eventName2" ) );
            
         	assertEvents();         	
     		}
     		catch ( e : AssertionFailedError )
     		{
     			return;
     		}	
         fail ( "Should have throw an AssertionFailedError" );
   	}

      public function testAssertEventsExpectedNoDispatchComplex() : void
   	{
   		try
   		{
         	listenForEvent( eventDispatcher, "eventName" );           
         	listenForEvent( eventDispatcher, "eventName2" );           
         	listenForEvent( eventDispatcher, "eventName3", EVENT_UNEXPECTED );           
            
         	eventDispatcher.dispatchEvent( new Event( "eventName" ) );
            
         	assertEvents();         	
     		}
     		catch ( e : AssertionFailedError )
     		{
     			return;
     		}	
         fail ( "Should have throw an AssertionFailedError" );
   	}
   	   	
      public function testAssertEventsNoListeners() : void
   	{
         eventDispatcher.dispatchEvent( new Event( "eventName" ) );
            
         assertEvents();
   	}
   	   	
   	private var eventDispatcher : EventDispatcher;
   }
}
