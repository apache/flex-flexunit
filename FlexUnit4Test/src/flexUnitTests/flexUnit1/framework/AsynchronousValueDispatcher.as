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
   
   import flash.utils.Timer;
   
   public class AsynchronousValueDispatcher extends EventDispatcher
   {
       public function AsynchronousValueDispatcher()
       {
           timer = new Timer(100, 1);
           timer.addEventListener("timer", timeout);
       }
   
       public function dispatchValue(value : String, time : int) : void
       {
           this.value = value;
           if (time > 0)
           {
               //BUG 114824 WORKAROUND - This bug is marked as fixed, but removing
               //the workaround causes the unit tests to fail. Need to look into this.
               timer = new Timer(time, 1);
               timer.addEventListener("timer", timeout);
               //END WORKAROUND
               //timer.delay = time;
               timer.start();
           }
           else
           {
               timeout(null);
           }
       }
   
       public function dispatchError(time : int) : void
       {
           dispatchValue("ERROR", time);
       }
   
   
       public function timeout(event : Event) : void
       {
           if (value == "ERROR")
           {
               throw new Error();
           }
           else
           {
               dispatchEvent(new ValueEvent(value));
           }
       }
   
       private var timer : Timer;
       private var value : String;
   
   }

}
