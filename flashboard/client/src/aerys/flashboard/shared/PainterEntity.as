package aerys.flashboard.shared
{
import aerys.orbit.network.NetworkEntity;
import aerys.orbit.network.Factory;
import flash.utils.ByteArray;

public class PainterEntity extends NetworkEntity
{
public static const CLASS_ID : uint = 32;
public static const SIZE : uint = 4;

private var _x : int;
public function get x() : int { return _x; }
public function set x(myValue : int) : void { _x = myValue; }
private var _y : int;
public function get y() : int { return _y; }
public function set y(myValue : int) : void { _y = myValue; }
private var _nickname : String;
public function get nickname() : String { return _nickname; }
public function set nickname(myValue : String) : void { _nickname = myValue; }


public function PainterEntity(id : uint)
{
super (id);
}

public override function get classId() : uint { return CLASS_ID; }

public override function deserialize(buffer : ByteArray) : void
{
_x = buffer.readShort();
_y = buffer.readShort();
_nickname = buffer.readUTF();
++_version;
}
}
}
