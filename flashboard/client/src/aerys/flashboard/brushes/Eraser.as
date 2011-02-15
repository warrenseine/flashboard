package aerys.flashboard.brushes
{
	import flash.display.BlendMode;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class Eraser extends AbstractBrush
	{
		private var _color		: uint = 0x0;

		public function Eraser()
		{
			super ();
			
			blendMode = BlendMode.ERASE;
		}
		
		override public function stroke(fromX : int, fromY : int, toX : int, toY : int, color : uint, size : uint) : void
		{
			var rect : Rectangle = new Rectangle(fromX, fromY, toX - fromX, toY - fromY);
						
			graphics.lineStyle(size, 0xffffff, 1);
			graphics.moveTo(fromX, fromY);
			graphics.lineTo(toX, toY);
		}
	}
}