package aerys.flashboard.brushes
{
	import flash.display.BlendMode;
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	public class AbstractBrush extends Sprite
	{
		public function clear() : void
		{
			
		}
		
		public function stroke(fromX 	: int,
							   fromY 	: int,
							   toX 		: int,
							   toY 		: int,
							   color	: uint,
							   size		: uint) : void
		{
			throw new Error();
		}
		
		public function strokeStart(x : int, y : int) : void
		{
		}
		
		public function strokeEnd() : void
		{
			
		}
	}
}