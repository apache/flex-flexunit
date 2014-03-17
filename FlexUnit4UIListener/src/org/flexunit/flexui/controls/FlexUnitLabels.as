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
package org.flexunit.flexui.controls
{
   import mx.utils.StringUtil;
   
   public class FlexUnitLabels
   {      
      /* TITLES */
      public static const FLEXUNIT_RUNNER : String = "FlexUnit Runner";
	  public static const FLEXUNIT : String = "FlexUnit";
	  public static const RUNNER : String = "Runner";
      public static const POWERED_BY_APACHE_FLEX : String = "powered by Apache Flex®";
      public static const TEST_CASES : String = "TEST CASES";
      public static const TEST_SUITE : String = "TEST SUITE";
      public static const RESULT_DETAILS : String = "RESULT DETAILS";
	  public static const TRADEMARKS : String = "Copyright © 2014 The Apache Software Foundation, Licensed under the Apache License, Version 2.0 Apache Flex, Apache and the Apache feather logo are trademarks of The Apache Software Foundation.";
      
      /* FILTERS */
      public static const ALL : String = "All results";
      public static const EMPTY : String = "Empty tests";
      public static const FAILURES_AND_ERRORS : String = "Failures & errors";
      public static const IGNORED_TESTS : String = "Ignored Tests";
      public static const FILTER_PROMPT : String = "Type filter";
      public static const FILTER_TOOLTIP : String = "You can filter either on methods names, or expected values or actual values";
      public static const ASSERTIONS_SLIDER_TOOLTIP : String = "Display between {0} and {1} assertions";
      
      /* TEST CASES TREE */
      public static const CASE : String = "Case";
      public static const RESULT : String = "Result";
      public static const ASSERTS : String = "Asserts";
      public static const ASSERTIONS_PER_TEST : String = "Assertions per test";
      public static const ASSERTIONS_PER_TEST_IN_AVERAGE : String = "assertions per test " + IN_AVERAGE;
      public static const EXPECTED : String = "Expected";
      public static const ACTUAL : String = "Actual";
	  public static const TEST_TIME : String = "Time";
      
      /* RESULTS POD*/
      public static const ASSERTIONS_MADE_MESSAGE : String = "{0} assertion{1} ha{2} been made {3}";
      public static const DURING_THIS_TEST : String = "during this test";
      public static const IN_AVERAGE : String = "in average";
      
      public static const PASSED_TESTS_NUMBER_MESSAGE : String = "{0} of {1} passed";
      
      public static const RUNNING_TESTS : String = "Running tests...";
      public static const FUNCTION : String = "Function";
      public static const LOCATION : String = "Location";
      public static const MESSAGE : String = "Message";
      public static const STACKTRACE : String = "Stacktrace";
      
      /* TEST COMPLETE POD */
      public static const TESTS_RUN : String = "Tests run";
      public static const TIME_TAKEN : String = "Time taken";
      public static const ERRORS : String = "Errors";
      public static const FAILURES : String = "Failures";
      public static const IGNORED : String = "Ignored";
      
      /* CHART */
      public static const CHART_TITLE : String = "Tests number per assertions number";
      public static const CHART_TOOLTIP : String = "Click to close the popup";
      
      public static function formatAssertions(
               formattedAssertionsMade : String,
               assertionsMade : Number,
               isAverage : Boolean ) : String
      {
         return StringUtil.substitute( ASSERTIONS_MADE_MESSAGE,
                     formattedAssertionsMade,
                     assertionsMade > 1 || assertionsMade == 0 ? "s" : "",
                     assertionsMade > 1 || assertionsMade == 0 ? "ve" : "s",
                     isAverage ? IN_AVERAGE : DURING_THIS_TEST );
      }
   }
}
