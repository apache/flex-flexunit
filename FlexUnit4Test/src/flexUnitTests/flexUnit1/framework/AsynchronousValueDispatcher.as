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
