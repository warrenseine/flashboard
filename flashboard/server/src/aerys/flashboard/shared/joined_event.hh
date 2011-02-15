#ifndef EVENT_35_HH_
# define EVENT_35_HH_

# include "aerys/orbit/network/events/network_event.hh"
# include "aerys/orbit/utils/const.hh"
# include "aerys/orbit/utils/property.hh"
# include "aerys/orbit/utils/ptr.hh"
# include "aerys/orbit/utils/boolean.hh"
# include "aerys/orbit/utils/integer.hh"
# include "aerys/orbit/utils/float.hh"
# include "aerys/orbit/utils/string.hh"

namespace aerys { namespace flashboard { namespace shared {
struct joined_event : aerys::orbit::network::events::network_event
{
ORBIT_CLASS_ID(35);
typedef aerys::orbit::utils::ptr<joined_event> ptr;

ORBIT_RW_PROPERTY(aerys::orbit::utils::int32, painter_id);

joined_event(aerys::orbit::utils::int32 painter_id = 0)
{
this->painter_id = painter_id;
}

bool will_propagate() const
{ return false; }

void deserialize(aerys::orbit::network::stream& s)
{
s >> this->painter_id;
}

void serialize(aerys::orbit::network::stream& s)
{
s << this->painter_id;
}
};
} } }

#endif
