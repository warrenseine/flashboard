package aerys.flashboard.shared
{
import aerys.orbit.network.events.NetworkEvent;
import aerys.orbit.network.Factory;
import aerys.orbit.ns.orbit;
import flash.utils.ByteArray;
use namespace orbit;

public class DrawEvent extends NetworkEvent
{
public static const CLASS_ID : uint = 33;
public static const DRAW : String = "draw";

private var _fromX : int;
public function get fromX() : int { return _fromX; }
public function set fromX(myValue : int) : void { _fromX = myValue; }
private var _fromY : int;
public function get fromY() : int { return _fromY; }
public function set fromY(myValue : int) : void { _fromY = myValue; }
private var _toX : int;
public function get toX() : int { return _toX; }
public function set toX(myValue : int) : void { _toX = myValue; }
private var _toY : int;
public function get toY() : int { return _toY; }
public function set toY(myValue : int) : void { _toY = myValue; }
private var _brush : int;
public function get brush() : int { return _brush; }
public function set brush(myValue : int) : void { _brush = myValue; }
private var _color : uint;
public function get color() : uint { return _color; }
public function set color(myValue : uint) : void { _color = myValue; }
private var _size : uint;
public function get size() : uint { return _size; }
public function set size(myValue : uint) : void { _size = myValue; }

public function DrawEvent(myFromX : int = 0, myFromY : int = 0, myToX : int = 0, myToY : int = 0, myBrush : int = 0, myColor : uint = 0, mySize : uint = 0)
{
super (DRAW);
fromX = myFromX;
fromY = myFromY;
toX = myToX;
toY = myToY;
brush = myBrush;
color = myColor;
size = mySize;
}

public override function get classId() : uint { return CLASS_ID; }

public function get willPropagate() : Boolean
{ return true; }

public override function deserialize(buffer : ByteArray) : void
{
_fromX = buffer.readShort();
_fromY = buffer.readShort();
_toX = buffer.readShort();
_toY = buffer.readShort();
_brush = buffer.readShort();
_color = buffer.readUnsignedInt();
_size = buffer.readUnsignedInt();
}

public override function serialize(buffer : ByteArray) : void
{
buffer.writeShort(_fromX);
buffer.writeShort(_fromY);
buffer.writeShort(_toX);
buffer.writeShort(_toY);
buffer.writeShort(_brush);
buffer.writeUnsignedInt(_color);
buffer.writeUnsignedInt(_size);
}
}
}
