package org.flexunit.flexui.data
{
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.collections.ListCollectionView;
   
   import org.flexunit.flexui.data.filter.ITestFunctionStatus;
   import org.flexunit.flexui.data.filter.TestfFunctionStatuses;

   public class TestCaseData extends AbstractRowData
   {
      public var testFunctions : IList = new ArrayCollection();
      public var filterText : String;
      public var selectedTestFunctionStatus : ITestFunctionStatus = TestfFunctionStatuses.ALL;
      
      [Embed(source="/assets/pass_small.png")]
      private static var passImg : Class;

      [Embed(source="/assets/fail_small.png")]
      private static var failImg : Class;

      private var _testsNumber : int;
      private var _testsPassedNumber : int;
	  private var _ignoredNumber:int;

      public function TestCaseData( testFunction : TestFunctionRowData )
      {
         label = testFunction.className;
         qualifiedClassName = testFunction.qualifiedClassName;
         testFunctions = new ArrayCollection();
         testSuccessful = true;
         _testsNumber = 0;
         _testsPassedNumber = 0;
		 _ignoredNumber = 0;
      }

      public function get children() : IList
      {
         return testFunctions;
      }

      override public function get failIcon() : Class
      {
         return failImg;
      }

      override public function get passIcon() : Class
      {
         return passImg;
      }
      
      override public function get isAverage() : Boolean
      {
         return true;
      }

	  public function get ignoredNumber() : int
	  {
		  return _ignoredNumber;
	  }

      public function get testsNumber() : int
      {
         return _testsNumber;
      }

      public function get passedTestsNumber() : int
      {
         return _testsPassedNumber;
      }
      
      override public function get assertionsMade() : Number
      {
         var currentAssertionsMade : Number = 0;
         
         for each ( var test : TestFunctionRowData in testFunctions )
         {
            currentAssertionsMade += test.assertionsMade;
         }
         
         if ( testFunctions.length > 0 )
         {
            return currentAssertionsMade / testFunctions.length;
         }
         return 0;
      }
      
      public function addTest( testFunctionToAdd : TestFunctionRowData ) : void
      {
         testFunctionToAdd.parentTestCaseSummary = this;
		 
		 if ( !testFunctionToAdd.testIgnored ) {
			 if ( !testFunctionToAdd.testSuccessful )
			 {
				 testSuccessful = false;
			 }
			 else
			 {
				 _testsPassedNumber++;
			 }
		 } else {
			 _ignoredNumber++;
		 }
		 
         _testsNumber++;
         testFunctions.addItem( testFunctionToAdd );
      }

      public function refresh() : void
      {
         var filteredChildren : ListCollectionView = testFunctions as ListCollectionView;
         if ( filteredChildren )
         {
            filteredChildren.filterFunction = searchFilterFunc;
            filteredChildren.refresh();
         }
      }

      private function searchFilterFunc( item : Object ) : Boolean
      {
         var testFunction : TestFunctionRowData = item as TestFunctionRowData;
         if ( ( className && className.toLowerCase().indexOf( filterText.toLowerCase() ) != - 1 ) ||
              filterText == null ||
              filterText == "" ||
              testFunction.isVisibleOnFilterText( filterText.toLowerCase() ) )
         {
            if ( selectedTestFunctionStatus.isTestFunctionVisible( testFunction ) )
               return true;
         }

         return false;
      }
   }
}
