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
package org.flexunit.flexui.event
{
   import flash.events.Event;

   public class TestRunnerBasePresentationModelProperyChangedEvent extends Event
   {
      public static const ROW_SELECTED_CHANGED : String = "rowSelectedChanged";
      public static const TEST_SUITE_RUN_DURATION_CHANGED : String = "testSuiteRunDurationChanged";
      public static const TOTAL_ERRORS_CHANGED : String = "totalErrorsChanged";
      public static const TOTAL_FAILURES_CHANGED : String = "totalFailuresChanged";
      public static const TOTAL_IGNORED_CHANGED : String = "totalIgnoredChanged";

      public static const PROGRESS_CHANGED : String = "progressChanged";
      public static const FILTER_CHANGED : String = "filterChanged";
      public static const FILTER_ENABLE_CHANGED : String = "filterEnableChanged";

      public function TestRunnerBasePresentationModelProperyChangedEvent( type : String, bubbles : Boolean = false )
      {
         super( type, bubbles );
      }
   }
}
