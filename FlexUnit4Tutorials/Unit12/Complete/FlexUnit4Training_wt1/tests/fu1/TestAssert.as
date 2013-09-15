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
﻿package fu1
{
   import flexunit.framework.*;
   
   public class TestAssert extends TestCase
   {      
      public function TestAssert( name : String = null )
      {
         super( name );
      }
      
      override public function setUp() : void
      {
        Assert.resetAssertionsMade();
      }
      
      //---------------------------------------------------------------------------
      
      public function testMatch() : void
      {
        Assert.assertMatch(
             /fr.*gt/,
             "feeefrbgbgbggt" );
      
        Assert.assertMatch(
             /.*@adobe\.com/,
             "xagnetti@adobe.com" );
      
        Assert.assertMatch(
             /.*@adobe.?com/,
             "xagnetti@adobevcom" );
        
        try
        {
           Assert.assertMatch(
             /.*@adobe\.com/,
             "xagnetti@adobevcom" );             
        }
        catch ( e : AssertionFailedError ) 
        {
           assertAssertionsHaveBeenMade( 4 );
       
           return;
        }
        fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testNoMatch() : void
      {
        Assert.assertNoMatch(
             /fr.*gtj/,
             "feeefrbgbgbggt" );
      
        Assert.assertNoMatch(
             /.*@adobe\.com/,
             "xagnetti@free.com" );
      
        Assert.assertNoMatch(
             /.*@adobe.?com/,
             "xagnetti@adobe.co" );
        
        try
        {
           Assert.assertNoMatch(
             /.*@adobe\.com/,
             "xagnetti@adobe.com" );
        }
        catch ( e : AssertionFailedError ) 
        {
           assertAssertionsHaveBeenMade( 4 );
           return;
        }
        fail();
      }       
      
      //---------------------------------------------------------------------------
      
      public function testContained() : void
      {
        Assert.assertContained(
             "rbgbg",
             "feeefrbgbgbggt" );
      
        Assert.assertContained(
             "adobe.com",
             "xagnetti@adobe.com" );
      
        Assert.assertContained(
             "xagnetti",
             "xagnetti@adobe.co" );
        
        try
        {
           Assert.assertContained(
             "adobe",
             "free.fr" );
        }
        catch ( e : AssertionFailedError ) 
        {
           assertAssertionsHaveBeenMade( 4 );
      
           return;
        }
        fail();
      }       
      
      //---------------------------------------------------------------------------
      
      public function testNotContained() : void
      {
        Assert.assertNotContained(
             "abc",
             "feeefrbgbgbggt" );
      
        Assert.assertNotContained(
             "adobe.com",
             "xagnetti@free.com" );
      
        Assert.assertNotContained(
             "kglossy",
             "xagnetti@adobe.co" );
        
        try
        {
           Assert.assertNotContained(
             "free",
             "free.fr" );
        }
        catch ( e : AssertionFailedError ) 
        {
           assertAssertionsHaveBeenMade( 4 );
           return;
        }
        fail();
      }       
      
      //---------------------------------------------------------------------------
      
      public function testFail() : void
      {
         try 
         {
             fail();
         } 
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 0 );
             return;
         }
         throw new AssertionFailedError( "fail uncaught" );
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertEquals() : void
      {
         var  o : Object = new Object();
         Assert.assertEquals( o, o );
         Assert.assertEquals( "5", 5 );
         try 
         {
             Assert.assertEquals( new Object(), new Object() );
         } 
         catch ( e : AssertionFailedError )  
         {
             assertAssertionsHaveBeenMade( 3 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertObjectEquals() : void
      {
         var o1 : Object = new Object();
         o1.firstname = "Yaniv";
         o1.lastname = "De Ridder";
         
         var o2 : Object = new Object();
         o2.firstname = "Yaniv";
         o2.lastname = "De Ridder";
         
         Assert.assertObjectEquals( o1, o2 );

         try 
         {
            o2.firstname = "";
            
            Assert.assertObjectEquals( o1, o2 );
         } 
         catch ( e : AssertionFailedError )  
         {
             assertAssertionsHaveBeenMade( 2 );
      
             return;
         }
         
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertEqualsNull() : void 
      {
         Assert.assertEquals( null, null );
         
         assertAssertionsHaveBeenMade( 1 );
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertEqualsNaN() : void 
      {
         Assert.assertEquals( NaN, NaN );
         try
         {
            Assert.assertEquals( NaN, new Object() );
         }
         catch ( e : AssertionFailedError )  
         {
             try
             {
                Assert.assertEquals( NaN, null );
             }
             catch ( e : AssertionFailedError )
             {
                assertAssertionsHaveBeenMade( 3 );
                return;
             }
         }
         fail();         
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertNullNotEqualsString() : void 
      {
         try 
         {
             Assert.assertEquals( null, "foo" );
             fail();
         }
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 1 );
         }
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertStringNotEqualsNull() : void 
      {
         try 
         {
             Assert.assertEquals( "foo", null );
             fail();
         }
         catch ( e : AssertionFailedError ) 
         {
             Assert.assertEquals( "expected:<foo> but was:<null>", e.message );
      
             assertAssertionsHaveBeenMade( 2 );
         }
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertNullNotEqualsNull() : void 
      {
         try 
         {
             Assert.assertEquals( null, new Object() );
         }
         catch ( e : AssertionFailedError ) 
         {
             Assert.assertEquals( 
                   "expected:<null> but was:<[object Object]>", 
                   e.message );
      
             assertAssertionsHaveBeenMade( 2 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertNull() : void 
      {
         try 
         {
             Assert.assertNull( new Object() );
         }
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 1 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertNotNull() : void 
      {
         try 
         {
             Assert.assertNotNull( null );
         }
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 1 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertTrue() : void
      {
         try 
         {
             Assert.assertTrue( false );
         }
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 1 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertFalse() : void
      {
         try 
         {
             Assert.assertFalse( true );
         }
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 1 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertStictlyEquals() : void 
      {
         var  o : Object = new Object();
         
         Assert.assertStrictlyEquals( o, o );
         try 
         {
             Assert.assertStrictlyEquals( "5", 5 );
         } 
         catch ( e : AssertionFailedError )  
         {
             assertAssertionsHaveBeenMade( 2 );
      
             return;
         }
         fail();
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertStrictlyEqualsNull() : void 
      {
         Assert.assertStrictlyEquals( null, null );
      
         assertAssertionsHaveBeenMade( 1 );
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertNullNotStrictlyEqualsString() : void 
      {
         try 
         {
             Assert.assertStrictlyEquals( null, "foo" );
             fail();
         }
         catch ( e : AssertionFailedError ) 
         {
             assertAssertionsHaveBeenMade( 1 );              
         }
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertStringNotStrictlyEqualsNull() : void 
      {
         try 
         {
             Assert.assertStrictlyEquals( "foo", null );
             fail();
         }
         catch ( e : AssertionFailedError ) 
         {
             Assert.assertEquals( "expected:<foo> but was:<null>", e.message );
      
             assertAssertionsHaveBeenMade( 2 );
         }
      }
      
      //---------------------------------------------------------------------------
      
      public function testAssertNullNotStrictlyEqualsNull() : void 
      {
         try 
         {
             Assert.assertStrictlyEquals( null, new Object() );
         }
         catch ( e : AssertionFailedError ) 
         {
             Assert.assertEquals( 
                   "expected:<null> but was:<[object Object]>",
                   e.message );
      
             assertAssertionsHaveBeenMade( 2 );
                   
             return;
         }
         fail();
      }
      
      public function testAssertionsMade() : void
      {
         Assert.resetEveryAsserionsFields();
         
         assertEquals(
            "",
            0,
            Assert.assetionsMade );

         assertEquals(
            "",
            0,
            Assert.maxAssertionsMade );

         assertEquals(
            "",
            2,
            Assert.totalAssertionsMade );
         
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         
         assertEquals(
            "",
            7,
            Assert.assetionsMade );

         assertEquals(
            "",
            0,
            Assert.maxAssertionsMade );

         assertEquals(
            "",
            9,
            Assert.totalAssertionsMade );
         
         Assert.resetAssertionsMade();
         
         assertEquals(
            "",
            0,
            Assert.assetionsMade );

         assertEquals(
            "",
            10,
            Assert.maxAssertionsMade );

         assertEquals(
            "",
            12,
            Assert.totalAssertionsMade );
         
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         Assert.oneAssertionHasBeenMade();
         
         assertEquals(
            "",
            11,
            Assert.assetionsMade );

         assertEquals(
            "",
            10,
            Assert.maxAssertionsMade );

         assertEquals(
            "",
            23,
            Assert.totalAssertionsMade );
         
         Assert.resetAssertionsMade();
         
         assertEquals(
            "",
            0,
            Assert.assetionsMade );

         assertEquals(
            "",
            14,
            Assert.maxAssertionsMade );

         assertEquals(
            "",
            26,
            Assert.totalAssertionsMade );
      }
      
      private function assertAssertionsHaveBeenMade( assetionsMade : Number ) : void
      {
        Assert.assertEquals(
          "Assert.assetionsMade is not correct",
          assetionsMade,
          Assert.assetionsMade )
      }
   }
}
