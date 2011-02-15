package aerys.flashboard.shared
{
import aerys.orbit.network.events.NetworkEvent;
import aerys.orbit.network.Factory;
import aerys.orbit.ns.orbit;
import flash.utils.ByteArray;
use namespace orbit;

public class JoinEvent extends NetworkEvent
{
public static const CLASS_ID : uint = 34;
public static const JOIN : String = "join";

private var _nickname : String;
public function get nickname() : String { return _nickname; }
public function set nickname(myValue : String) : void { _nickname = myValue; }

public function JoinEvent(myNickname : String = "")
{
super (JOIN);
nickname = myNickname;
}

public override function get classId() : uint { return CLASS_ID; }

public function get willPropagate() : Boolean
{ return false; }

public override function deserialize(buffer : ByteArray) : void
{
_nickname = buffer.readUTF();
}

public override function serialize(buffer : ByteArray) : void
{
buffer.writeUTF(_nickname);
}
}
}
