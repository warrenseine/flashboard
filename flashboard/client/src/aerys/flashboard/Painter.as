package aerys.flashboard
{
	import aerys.flashboard.shared.PainterEntity;
	import aerys.orbit.network.EntityProxy;
	import aerys.orbit.network.events.UpdatedEvent;
	
	import aze.motion.EazeTween;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	
	public class Painter extends Sprite
	{
		private var _entity	: PainterEntity	= null;
		private var _proxy	: EntityProxy	= null;
		private var _marker	: Marker		= null;
		
		public function get entity() : PainterEntity
		{
			return _entity;
		}
		
		public function Painter(myEntity : PainterEntity)
		{
			super();
			
			_entity = myEntity;
			_proxy = new EntityProxy(_entity, ["x", "y"]);
			_marker = new Marker(_entity.nickname);
			
			addChild(_marker);
			_marker.graphics.beginFill(Math.random() * 0xffffff);
			_marker.graphics.drawCircle(0, 0, 2);
			
			_entity.addEventListener(UpdatedEvent.UPDATED, updatedHandler);
		}
		
		private function updatedHandler(event : UpdatedEvent) : void
		{
			if (_entity.nickname != _marker.nickname)
				_marker.nickname = _entity.nickname;
			
			new EazeTween(this).to(.066, {x: _entity.x,
										  y: _entity.y});
		}
	}
}