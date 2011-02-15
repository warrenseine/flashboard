#ifndef EVENT_36_HH_
# define EVENT_36_HH_

# include "aerys/orbit/network/events/network_event.hh"
# include "aerys/orbit/utils/const.hh"
# include "aerys/orbit/utils/property.hh"
# include "aerys/orbit/utils/ptr.hh"
# include "aerys/orbit/utils/boolean.hh"
# include "aerys/orbit/utils/integer.hh"
# include "aerys/orbit/utils/float.hh"
# include "aerys/orbit/utils/string.hh"

namespace aerys { namespace flashboard { namespace shared {
struct move_event : aerys::orbit::network::events::network_event
{
ORBIT_CLASS_ID(36);
typedef aerys::orbit::utils::ptr<move_event> ptr;

ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, x);
ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, y);

move_event(aerys::orbit::utils::int16 x = 0, aerys::orbit::utils::int16 y = 0)
{
this->x = x;
this->y = y;
}

bool will_propagate() const
{ return false; }

void deserialize(aerys::orbit::network::stream& s)
{
s >> this->x >> this->y;
}

void serialize(aerys::orbit::network::stream& s)
{
s << this->x << this->y;
}
};
} } }

#endif
