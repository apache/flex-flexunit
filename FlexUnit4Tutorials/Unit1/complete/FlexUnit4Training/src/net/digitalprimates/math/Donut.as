package net.digitalprimates.math
{
	import flash.geom.Point;
	
	public class Donut extends Circle
	{
		public static const DONUT_RADIUS_RATIO:Number = 0.2;
		
		private var _innerRadius:Number;
		
		public function Donut( origin:Point, radius:Number )
		{
			super( origin, radius );
			
			_innerRadius = radius * DONUT_RADIUS_RATIO;
		}

		public function get innerRadius():Number
		{
			return _innerRadius;
		}

	}
}