package aerys.flashboard.shared
{
import aerys.orbit.network.Factory;
import aerys.orbit.network.IInitializer;

import aerys.flashboard.shared.DrawEvent;
import aerys.flashboard.shared.JoinEvent;
import aerys.flashboard.shared.JoinedEvent;
import aerys.flashboard.shared.MoveEvent;
import aerys.flashboard.shared.PainterEntity;

public class Initializer implements IInitializer
{
public function get protocolHash() : String { return "f1d1fd399c0c24d51fc19205247b0912"; }

public function registerEvents() : void
{
var factory : Factory = Factory.getFactory(this);
factory.registerEvent(DrawEvent);
factory.registerEvent(JoinEvent);
factory.registerEvent(JoinedEvent);
factory.registerEvent(MoveEvent);
}
public function registerEntities() : void
{
var factory : Factory = Factory.getFactory(this);
factory.registerEntity(PainterEntity);
}
}
}
