package org.flexunit.internals.matchers
{
	import org.hamcrest.Matcher;

	/**
	 * Implements an EachMatcher for internal framework use 
	 * @author mlabriola
	 * 
	 */	
	public class Each {
		/**
		 * an each matcher 
		 * @param individual Matcher
		 * @return Matcher
		 * 
		 */		
		public static function eachOne( individual:Matcher ):Matcher {
			return new EachMatcher( individual );
		}	
	}
}

import org.hamcrest.BaseMatcher;
import org.hamcrest.Matcher;
import org.hamcrest.Description;
import org.hamcrest.core.not;
import org.hamcrest.collection.hasItem;

/**
 * Internal implementation of each matcher 
 * @author mlabriola
 * 
 */
class EachMatcher extends BaseMatcher {

	/**
	 * @private
	 */
	private var allItemsAre:Matcher;
	/**
	 * @private
	 */
	private var individual:Matcher;

	/**
	 * Constructor
	 */
	public function EachMatcher( individual:Matcher ):void {
		this.individual = individual;
		allItemsAre = not(hasItem(not(individual)));
	}
	
	/**
	 * @private
	 */
    override public function matches(item:Object):Boolean {
      return allItemsAre.matches( item );
    }

	/**
	 * @private
	 */
    override public function describeTo(description:Description):void {
		description.appendText("each ");
		individual.describeTo(description);	      
    }
}