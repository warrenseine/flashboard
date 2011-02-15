package aerys.flashboard
{	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	
	public class Marker extends Sprite
	{
		private static const SHADOW : DropShadowFilter = new DropShadowFilter(0, 45, 0, 1, 2, 2, 3);
		
		private var _label : TextField = new TextField();
		
		public function get nickname() : String
		{
			return _label.text;
		}
		
		public function set nickname(myNickname : String) : void
		{
			_label.text = myNickname;
		}
		
		public function Marker(myNickname : String = "")
		{
			_label.text = myNickname;
			_label.y = -_label.textHeight / 2.;
			_label.x = 6;
			_label.selectable = false;
			_label.textColor = 0xffffffff;
			addChild(_label);
			
			filters = [SHADOW];
		}
	}
}