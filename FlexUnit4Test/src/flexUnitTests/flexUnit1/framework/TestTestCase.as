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
﻿package flexUnitTests.flexUnit1.framework
{
   import flexunit.framework.*;
   
   public class TestTestCase extends TestCase
   {
       public function TestTestCase(name : String = null)
       {
           super(name);
       }
   
       public function testCaseToString() : void
       {
           Assert.assertEquals( "testCaseToString (flexUnitTests.flexUnit1.framework::TestTestCase)", toString() );
       }
   
   //------------------------------------------------------------------------------
   
       public function testError() : void
       {
           var error : ErrorTestCase = new ErrorTestCase("throwError");
           verifyError( error );
       }
   
   //------------------------------------------------------------------------------
   
       public function testRunAndTearDownFails() : void
       {
           var fails : TearDownErrorTestCase = new TearDownErrorTestCase("throwError");
           //MATT: because of the asynchronous support an error in tearDown will now be an additional
           //error instead of overwriting the error that was thrown in the test run
           verifyError( fails, 2 );
           Assert.assertTrue( fails.expectedResult );
       }
   
   //------------------------------------------------------------------------------
   
       public function testSetupFails() : void
       {
           var fails : SetupErrorTestCase = new SetupErrorTestCase( "throwError" )
           verifyError( fails, 1 );
       }
   
   //------------------------------------------------------------------------------
   
       public function testSuccess() : void
       {
           var success : TestCase = new SuccessTestCase( "testSuccess" )
           verifySuccess( success );
       }
   
   //------------------------------------------------------------------------------
   
       public function testFailure() : void
       {
           var failure : TestCase = new FailureTestCase( "testFailure" )
           verifyFailure( failure );
       }
   
   //------------------------------------------------------------------------------
   
       public function testTearDownAfterError() : void
       {
           var fails : TearDownTestCase = new TearDownTestCase("throwError");
           verifyError( fails );
           Assert.assertTrue( fails.expectedResult );
       }
   
   //------------------------------------------------------------------------------
   
       public function testTearDownFails() : void
       {
           var fails : TearDownErrorTestCase = new TearDownErrorTestCase( "testSuccess" )
           verifyError( fails );
       }
   
   //------------------------------------------------------------------------------
   
       public function testTearDownSetupFails() : void
       {
           var fails : SetupErrorTearDownTestCase = new SetupErrorTearDownTestCase("testSuccess");
           verifyError( fails );
           Assert.assertFalse( fails.expectedResult );
       }
   
   //------------------------------------------------------------------------------
   
       public function testWasRun() : void
       {
           var test : SuccessTestCase = new SuccessTestCase("testSuccess");
           test.run();
           Assert.assertTrue( test.expectedResult );
       }
   
   //------------------------------------------------------------------------------
   
       public function testExceptionRunningAndTearDown() : void
       {
           var t : TestCase = new TearDownErrorTestCase("testSuccess");
           var result : TestResult = new TestResult();
           t.runWithResult( result );
           var failure : TestFailure = TestFailure ( result.errorsIterator().next() );
           Assert.assertEquals( "tearDown", failure.thrownException().message );
       }
   
   //------------------------------------------------------------------------------
   
   //MATT: since the automatic test creation doesn't work anymore and we've verified other no-arg tests (in SuccessTestCase)
   //we should be cool without this one
   /*
       public function testNoArgTestCasePasses() : void
       {
           var t : Test = new TestSuite( NoArgTestCase );
           var result : TestResult = new TestResult();
           
           t.runWithResult(  result );
   
           Assert.assertEquals( 1, result.runCount() );
           Assert.assertEquals( 0, result.failureCount() );
           Assert.assertEquals( 0, result.errorCount() );
   
       }
   */
   
   //------------------------------------------------------------------------------
   
       public function testNamelessTestCase() : void
       {
           var test : TestCase = new TestCase();
           var result : TestResult = test.run();
           Assert.assertEquals( 
                     "result.runCount() is not correct", 
                     1, 
                     result.runCount() );
           Assert.assertEquals( 
                     "result.failureCount() is not correct", 
                     1, 
                     result.failureCount() );
           Assert.assertEquals( 
                     "result.errorCount() is not correct", 
                     0, 
                     result.errorCount()  );
           Assert.assertEquals( 
                     "No test method to run",
                     TestFailure( result.failuresIterator().next() ).thrownException().message );
           /*
           try
           {
               t.run();
               fail();
           }
           catch ( e: AssertionFailedError )
           {
           }
           */
       }
   
   //------------------------------------------------------------------------------
   
       private function verifyError( test : TestCase , errorCount : int = 1) : void
       {
           var result : TestResult = test.run();
           Assert.assertEquals( 
                     "result.runCount() is not correct", 
                     1, 
                     result.runCount() );
           Assert.assertEquals( 
                     "result.failureCount() is not correct", 
                     0, 
                     result.failureCount() );
           Assert.assertEquals( 
                     "result.errorCount() is not correct", 
                     errorCount, 
                     result.errorCount()  );
       }
       
   //------------------------------------------------------------------------------
   
       private function  verifyFailure( test : TestCase ) : void
       {
           var result : TestResult = test.run();
           Assert.assertEquals( 
                     "result.runCount() is not correct", 
                     1,  
                     result.runCount() );
           Assert.assertEquals( 
                     "result.failureCount() is not correct", 
                     1, 
                     result.failureCount()  );
           Assert.assertEquals(  
                     "result.errorCount() is not correct", 
                     0, 
                     result.errorCount() );
       }
   
   //------------------------------------------------------------------------------
   
       private function  verifySuccess( test : TestCase ) : void
       {
           var result : TestResult = test.run();
           Assert.assertEquals(  
                     "result.runCount() is not correct", 
                     1, 
                     result.runCount() );
           Assert.assertEquals( 
                     "result.failureCount() is not correct", 
                     0, 
                     result.failureCount() );
           Assert.assertEquals(   
                     "result.errorCount() is not correct", 
                     0, 
                     result.errorCount() );
       }
   }
}