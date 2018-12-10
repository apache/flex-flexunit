/*
   Copyright (c) 2008. Adobe Systems Incorporated.
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

     * Redistributions of source code must retain the above copyright notice,
       this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution.
     * Neither the name of Adobe Systems Incorporated nor the names of its
       contributors may be used to endorse or promote products derived from this
       software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
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
