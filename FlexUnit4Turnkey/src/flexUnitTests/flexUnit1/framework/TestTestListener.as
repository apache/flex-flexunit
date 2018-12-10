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
﻿package flexUnitTests.flexUnit1.framework{   import flexunit.framework.*;      public class TestTestListener extends TestCase implements TestListener   {       public function TestTestListener(name : String = null)       {           super(name);       }      	public function addError( test : Test, e : Error ) : void   	{   		errorCount++;   	}      //------------------------------------------------------------------------------      	public function addFailure( test : Test , e : AssertionFailedError ) : void   	{   		failureCount++;   	}   	   //------------------------------------------------------------------------------      	public function startTest( test : Test ) : void    	{   		startCount++;   	}      //------------------------------------------------------------------------------      	public function endTest( test : Test ) : void    	{   		endCount++;   	}   	   //------------------------------------------------------------------------------      	override public function setUp() : void   	{   		result = new TestResult();   		result.addListener( TestListener(this) );   	   		startCount = 0;   		endCount = 0;   		failureCount = 0;   		errorCount = 0;   	}   	   //------------------------------------------------------------------------------   	   	public function testError():void    	{   		var test : TestCase = new ErrorTestCase( "throwError" )   		test.runWithResult( result );   		Assert.assertEquals("error", 1, errorCount );   		Assert.assertEquals("end", 1, endCount );   		Assert.assertEquals("failure", 0, failureCount);   	}      //------------------------------------------------------------------------------   	   	public function testFailure():void    	{   		var test : TestCase = new FailureTestCase( "testFailure" )   		test.runWithResult( result );   		Assert.assertEquals("failure", 1, failureCount );   		Assert.assertEquals("end", 1, endCount );   		Assert.assertEquals("error", 0, errorCount);   	}      //------------------------------------------------------------------------------   	   	public function testStartStop():void    	{   		var test : TestCase = new SuccessTestCase( "testSuccess" )   		test.runWithResult( result );   		Assert.assertEquals("start", 1, startCount );   		Assert.assertEquals("end", 1, endCount );   		Assert.assertEquals("error", 0, errorCount);   		Assert.assertEquals("failure", 0, failureCount);   	}      //------------------------------------------------------------------------------   	   	private var result : TestResult;   	private var startCount : Number;   	private var endCount : Number;   	private var failureCount : Number;   	private var errorCount : Number;   }}