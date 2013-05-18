package flexUnitTests.flexUnit1.framework
{
   import flexunit.framework.*;
   
   public class ErrorTestCase extends TestCase
   {
   
       public function ErrorTestCase(name : String):void
       {
           super(name);
       }
   
       public function throwError():void
       {
          assertTrue( true ) 
          
          throw new Error();
       }
   }
}