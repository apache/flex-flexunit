package net.digitalprimates.components.layout
{
	import flash.geom.Point;
	
	import mx.core.ILayoutElement;
	
	import net.digitalprimates.math.Circle;
	
	import spark.layouts.supportClasses.LayoutBase;
	
	public class CircleLayout extends LayoutBase {
		
		private var _circle:Circle;
		
		private var _offset:Number = 0;

		public function get circle():Circle
		{
			return _circle;
		}

		public function set circle(value:Circle):void
		{
			_circle = value;
			target.invalidateDisplayList();
		}

		public function get offset():Number {
			return _offset;
		}

		public function set offset(value:Number):void {
			_offset = value;
			target.invalidateDisplayList();
		}

		override public function updateDisplayList( contentWidth:Number, contentHeight:Number ):void {
			var i:int;
			var element:ILayoutElement;
			var elementLayoutPoint:Point;
			var elementAngleInRadians:Number;
			var radiansBetweenElements:Number = ( Circle.RADIANS_PER_CIRCLE ) / target.numElements;
			
			super.updateDisplayList( contentWidth, contentHeight );
			
			if(circle)
			{
				for ( i = 0; i < target.numElements; i++ ) {
					element = target.getElementAt(i);
					
					elementAngleInRadians = ( i * radiansBetweenElements ) - offset;
					elementLayoutPoint = circle.getPointOnCircle( elementAngleInRadians );
					
					//used to be setActualSize()
					element.setLayoutBoundsSize( NaN, NaN );
					var elementWidth:Number = element.getLayoutBoundsWidth()/2;
					var elementHeight:Number = element.getLayoutBoundsHeight()/2;
					
					//Use to be move()
					element.setLayoutBoundsPosition( elementLayoutPoint.x-elementWidth, elementLayoutPoint.y-elementHeight );
					//trace( "x:", elementLayoutPoint.x-elementWidth );
					//trace( "y:", elementLayoutPoint.y-elementHeight );
				}
			}
		}
		
		public function CircleLayout() {
			super();
		}
	}
}