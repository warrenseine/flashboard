package aerys.flashboard.brushes
{
	import flash.display.BlendMode;
	import flash.display.Graphics;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	public class SketchyBrush extends AbstractBrush
	{
		private var _points		: Vector.<Point>	= new Vector.<Point>();
		private var _prevMouseX	: int				= 0;
		private var _prevMouseY	: int				= 0;
		private var _count		: int				= 0;
		
		public function SketchyBrush()
		{
			super();
			
			//transform.colorTransform = new ColorTransform(1., 1., 1., .5);
			//blendMode = BlendMode.MULTIPLY;
		}
		
		override public function clear() : void
		{
			_points.length = _count = 0;
		}
		
		override public function strokeStart(x : int, y : int) : void
		{
			super.strokeStart(x, y);
			
			_prevMouseX = x;
			_prevMouseY = y;
		}
		
		override public function stroke(fromX	: int,
										fromY	: int,
										toX		: int,
										toY		: int,
										color	: uint,
										size	: uint) : void
		{
			_points.push(new Point(toX, toY));
			
			graphics.lineStyle(size, color, size == 1 ? .5 : 1.);
			graphics.moveTo(fromX, fromY);
			graphics.lineTo(toX, toY);
			
			graphics.lineStyle(size / 10., color, .02 * size);
			for (var i : int = 0; i < _points.length; ++i)
			{
				var dx : int = _points[i].x - _points[_count].x;
				var dy : int = _points[i].y - _points[_count].y;
				var d : Number = dx * dx + dy * dy;
				
				if (d < 4000. && Math.random() > (d / 2000.))
				{
					graphics.moveTo(_points[_count].x + (dx * .3), _points[_count].y + (dy * .3));
					graphics.lineTo(_points[i].x - (dx * .3), _points[i].y - (dy * .3));
				}
			}
			
			_prevMouseX = toX;
			_prevMouseY = toY;
			
			_count++;
		}
	}
}