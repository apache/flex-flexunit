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