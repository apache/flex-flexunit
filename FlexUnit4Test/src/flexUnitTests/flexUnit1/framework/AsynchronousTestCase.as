package flexUnitTests.flexUnit1.framework
{

   import flexunit.framework.*;
   
   public class AsynchronousTestCase extends TestCase
   {   
       public function AsynchronousTestCase(name : String)
       {
           super(name);
       }
   
       override public function setUp() : void
       {
           dispatcher = new AsynchronousValueDispatcher();
       }
   
       public function testInTimePass() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_1, TIME_PASS);
       }
   
       public function testInTimeFail() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_2, TIME_PASS);
       }
   
       public function testInTimeError() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1));
           dispatcher.dispatchError(TIME_PASS);
       }
   
       public function testTooLatePass() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_1, TIME_FAIL);
       }
   
       public function testTooLateFail() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_2, TIME_FAIL);
       }
   
       public function testTooLateError() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1));
           dispatcher.dispatchError(TIME_FAIL);
       }
   
       public function handleValue(event : ValueEvent, expected : String) : void
       {
           var actual : String = event.value;
           Assert.assertEquals(expected, actual);
       }
   
   
       public function testSecondInTimePass() : void
       {
           dispatcher.addEventListener("value", addAsync(handleFirstValueThenPassInTime, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_1, TIME_PASS);
       }
   
       public function handleFirstValueThenPassInTime(event : ValueEvent, expected : String) : void
       {
           var actual : String = event.value;
           Assert.assertEquals(expected, actual);
           addAsync(handleValue, TIME_SYNC, VALUE_2);
           dispatcher.dispatchValue(VALUE_2, TIME_PASS);
       }
   
       public function testSecondInTimeFail() : void
       {
           dispatcher.addEventListener("value", addAsync(handleFirstValueThenFailInTime, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_1, TIME_PASS);
       }
   
       public function handleFirstValueThenFailInTime(event : ValueEvent, expected : String) : void
       {
           var actual : String = event.value;
           Assert.assertEquals(expected, actual);
           addAsync(handleValue, TIME_SYNC, VALUE_2);
           dispatcher.dispatchValue(VALUE_1, TIME_PASS);
       }
   
       public function testSecondTooLatePass() : void
       {
           dispatcher.addEventListener("value", addAsync(handleFirstValueThenPassTooLate, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_1, TIME_PASS);
       }
   
       public function handleFirstValueThenPassTooLate(event : ValueEvent, expected : String) : void
       {
           var actual : String = event.value;
           Assert.assertEquals(expected, actual);
           addAsync(handleValue, TIME_SYNC, VALUE_2);
           dispatcher.dispatchValue(VALUE_2, TIME_FAIL);
       }
   
       public function testSecondTooLateFail() : void
       {
           dispatcher.addEventListener("value", addAsync(handleFirstValueThenFailTooLate, TIME_SYNC, VALUE_1));
           dispatcher.dispatchValue(VALUE_1, TIME_PASS);
       }
   
       public function handleFirstValueThenFailTooLate(event : ValueEvent, expected : String) : void
       {
           var actual : String = event.value;
           Assert.assertEquals(expected, actual);
           addAsync(handleValue, TIME_SYNC, VALUE_2);
           dispatcher.dispatchValue(VALUE_1, TIME_FAIL);
       }
   
       public function testTimeoutFunctionPass() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1, handleTimeoutPass));
           dispatcher.dispatchValue(VALUE_1, TIME_FAIL);
       }
   
       public function handleTimeoutPass(expected : String) : void
       {
           //do nothing, this should turn into a pass
       }
   
       public function testTimeoutFunctionFail() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1, handleTimeoutFail));
           dispatcher.dispatchValue(VALUE_1, TIME_FAIL);
       }
   
       public function handleTimeoutFail(expected : String) : void
       {
           fail("async method not called in time");
       }
   
       public function testNotReallyAsynchronousPass() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1, handleValue));
           dispatcher.dispatchValue(VALUE_1, 0);
       }
   
       public function testNotReallyAsynchronousFail() : void
       {
           dispatcher.addEventListener("value", addAsync(handleValue, TIME_SYNC, VALUE_1, handleValue));
           dispatcher.dispatchValue(VALUE_2, 0);
       }
   
       private var dispatcher : AsynchronousValueDispatcher;
   
       private static var VALUE_1 : String = "value1";
       private static var VALUE_2 : String = "value2";
       public static var TIME_PASS : int = 50;
       public static var TIME_FAIL : int = 250;
       public static var TIME_SYNC : int = 100;
   }
}