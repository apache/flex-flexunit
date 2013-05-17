package org.flexunit
{
	import org.hamcrest.Matcher;
	
	public function assumeThat( actual:Object, matcher:Matcher ):void {
		Assume.assumeThat( actual, matcher );
	}
}