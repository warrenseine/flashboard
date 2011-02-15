package aerys.flashboard.brushes
{
	import flash.display.Graphics;
	
	public class PencilBrush extends AbstractBrush
	{
		override public function stroke(fromX : int, fromY : int, toX : int, toY : int, color : uint, size : uint) : void
		{
			graphics.lineStyle(size, color, 1.);
			graphics.moveTo(fromX, fromY);
			graphics.lineTo(toX, toY);
		}
	}
}