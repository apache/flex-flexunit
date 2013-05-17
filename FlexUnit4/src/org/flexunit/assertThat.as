package org.flexunit
{
	import org.hamcrest.assertThat;
	
	/**
	 * Creates a hamcrest style assertion using assertThat
	 * 
	 * @param ...rest Rest may specify any values to be tested. It must include
	 * 		a left and a right value as well as at least one matcher.  An error message
	 * 		may also be passed if passed as the first argument.
	 * 
	 * 
	 * @example
	 * <listing version="3.0">
	 * 		assertThat( "3 is usually 3", 3, equals( 4 ) );
	 * </listing>
	 */
	public function assertThat( ...rest ):void {
		Assert.assertWithApply( org.hamcrest.assertThat, rest );
		//org.hamcrest.assertThat.apply( null, rest );
	}
}