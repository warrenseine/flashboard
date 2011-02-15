package aerys.flashboard.shared
{
import aerys.orbit.network.events.NetworkEvent;
import aerys.orbit.network.Factory;
import aerys.orbit.ns.orbit;
import flash.utils.ByteArray;
use namespace orbit;

public class JoinedEvent extends NetworkEvent
{
public static const CLASS_ID : uint = 35;
public static const JOINED : String = "joined";

private var _painterId : int;
public function get painterId() : int { return _painterId; }
public function set painterId(myValue : int) : void { _painterId = myValue; }

public function JoinedEvent(myPainterId : int = 0)
{
super (JOINED);
painterId = myPainterId;
}

public override function get classId() : uint { return CLASS_ID; }

public function get willPropagate() : Boolean
{ return false; }

public override function deserialize(buffer : ByteArray) : void
{
_painterId = buffer.readInt();
}

public override function serialize(buffer : ByteArray) : void
{
buffer.writeInt(_painterId);
}
}
}
