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
package org.flexunit.demo {
   import flash.events.MouseEvent;
   
   import mx.events.DynamicEvent;
   import mx.events.FlexEvent;
   
   import org.flexunit.Assert;
   import org.flexunit.assertThat;
   import org.flexunit.async.Async;
   import org.fluint.uiImpersonation.UIImpersonator;
   import org.hamcrest.object.equalTo;
   
   public class EchoPanelTest {
      private var panel : EchoPanel;
      
      [Before(async, ui)]
      public function setUp() : void {
         panel = new EchoPanel();
         
         //After added to display list wait for signal that component was created to continue the test
         Async.proceedOnEvent(this, panel, FlexEvent.CREATION_COMPLETE);
         
         //Add to display list 
         UIImpersonator.addChild(panel);
      }

      [Test(async, ui, timeout="1000")]
      public function testEventWasDispatchedOnClick() : void {
         //handler used to assert text was passed in event
         var result : Function = function(event : DynamicEvent, passThroughData : Object) : void {
               assertThat(event.userText, equalTo("This should show up in the event"));
            };
            
         //register handler for when userEnteredText event is dispatched
         Async.handleEvent(this, panel, "userEnteredText", result);
         
         //set text
         panel.userText.text = "This should show up in the event";
         
         //click the echo button and hopefully our event is dispatched
         panel.echoButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      [Test(async, ui, timeout="1000")]
      public function testEventWasNotDispatchedWithoutClick() : void {
         //register handler for when userEnteredText event is dispatched
         Async.failOnEvent(this, panel, "userEnteredText");
         
         //set text
         panel.userText.text = "some text";
      }
      
      [After]
      public function tearDown() : void {
         panel = null;
      }
   }
}