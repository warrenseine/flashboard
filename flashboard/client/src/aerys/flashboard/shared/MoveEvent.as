package aerys.flashboard.shared
{
import aerys.orbit.network.events.NetworkEvent;
import aerys.orbit.network.Factory;
import aerys.orbit.ns.orbit;
import flash.utils.ByteArray;
use namespace orbit;

public class MoveEvent extends NetworkEvent
{
public static const CLASS_ID : uint = 36;
public static const MOVE : String = "move";

private var _x : int;
public function get x() : int { return _x; }
public function set x(myValue : int) : void { _x = myValue; }
private var _y : int;
public function get y() : int { return _y; }
public function set y(myValue : int) : void { _y = myValue; }

public function MoveEvent(myX : int = 0, myY : int = 0)
{
super (MOVE);
x = myX;
y = myY;
}

public override function get classId() : uint { return CLASS_ID; }

public function get willPropagate() : Boolean
{ return false; }

public override function deserialize(buffer : ByteArray) : void
{
_x = buffer.readShort();
_y = buffer.readShort();
}

public override function serialize(buffer : ByteArray) : void
{
buffer.writeShort(_x);
buffer.writeShort(_y);
}
}
}
