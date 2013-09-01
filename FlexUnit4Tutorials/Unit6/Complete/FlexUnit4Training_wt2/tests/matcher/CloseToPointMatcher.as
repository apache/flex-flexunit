package matcher
{
	import flash.geom.Point;
	
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;
	
	public class CloseToPointMatcher extends TypeSafeMatcher
	{
		private var point:Point;
		private var tolerance:Number;
		
		public function CloseToPointMatcher( point:Point, tolerance:Number ) {
			super(Point);
			this.point = point;
			this.tolerance = tolerance;
		}
		
		override public function matchesSafely(item:Object):Boolean {
			var distance:Number = Point.distance( item as Point, point );
			
			return( Math.abs( distance ) - tolerance < 0 );
		}
		
		override public function describeTo(description:Description):void {
			description.appendText( "point " ).appendText( point.toString() );
		}
	}
}