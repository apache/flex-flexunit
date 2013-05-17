package org.flexunit.utils {
	import org.flexunit.runner.IDescription;

	/**
	 * This is a temporary class to work around parsing name issues with the Description when using parameterized
	 * testing. It is my hope that it can be removed and replaced with a better solution for 4.2 
	 * @author mlabriola
	 * 
	 */	
	public class DescriptionUtil {
		/**
		 *
		 * Returns a method name based on the provided description. In particular reverses the naming process of
		 * the parameterized runner. This class will be removed once description is modified for 4.2
		 *  
		 * @param description
		 * @return 
		 * 
		 */		
		public static function getMethodNameFromDescription( description:IDescription ):String {
			var spaceIndex:int = description.displayName.indexOf( " " );
			var hayStack:String;
			var lastDotIndex:int = 0;
			
			if ( spaceIndex < 0 ) {
				//This is a normal method
				hayStack = description.displayName;
			} else {
				//This is a parameterized method
				hayStack = description.displayName.substr( 0, spaceIndex );
			}
			
			lastDotIndex = hayStack.lastIndexOf( "." );
			
			if ( lastDotIndex < 0 ) {
				return "";
			}
			
			return hayStack.substr( lastDotIndex + 1 );
		}
	}
}