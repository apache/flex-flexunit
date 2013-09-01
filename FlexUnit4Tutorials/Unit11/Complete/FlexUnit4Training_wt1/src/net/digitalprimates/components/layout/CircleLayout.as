package net.digitalprimates.components.layout
{
	import flash.geom.Point;
	
	import mx.core.ILayoutElement;
	
	import net.digitalprimates.math.Circle;
	
	import spark.layouts.supportClasses.LayoutBase;
	
	public class CircleLayout extends LayoutBase {
		
		private var _offset:Number = 0;

		public function get offset():Number {
			return _offset;
		}

		public function set offset(value:Number):void {
			_offset = value;
			target.invalidateDisplayList();
		}

		public function getLayoutRadius( contentWidth:Number, contentHeight:Number ):Number {
			var maxX:Number = (contentWidth/2)*.8;
			var maxY:Number = (contentHeight/2)*.8;
			var radius:Number = Math.min( maxX, maxY );
			
			return Math.max( radius, 1 );
		}
		
		override public function updateDisplayList( contentWidth:Number, contentHeight:Number ):void {
			var i:int;
			var element:ILayoutElement;
			var elementLayoutPoint:Point;
			var elementAngleInRadians:Number;
			var radiansBetweenElements:Number = ( Circle.RADIANS_PER_CIRCLE ) / target.numElements;
			var circle:Circle = new Circle( new Point( contentWidth/2, contentHeight/2 ), getLayoutRadius( contentWidth, contentHeight ) );
			
			super.updateDisplayList( contentWidth, contentHeight );
			
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
		
		public function CircleLayout() {
			super();
		}
	}
}