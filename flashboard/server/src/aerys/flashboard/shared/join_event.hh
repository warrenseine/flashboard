#ifndef EVENT_34_HH_
# define EVENT_34_HH_

# include "aerys/orbit/network/events/network_event.hh"
# include "aerys/orbit/utils/const.hh"
# include "aerys/orbit/utils/property.hh"
# include "aerys/orbit/utils/ptr.hh"
# include "aerys/orbit/utils/boolean.hh"
# include "aerys/orbit/utils/integer.hh"
# include "aerys/orbit/utils/float.hh"
# include "aerys/orbit/utils/string.hh"

namespace aerys { namespace flashboard { namespace shared {
struct join_event : aerys::orbit::network::events::network_event
{
ORBIT_CLASS_ID(34);
typedef aerys::orbit::utils::ptr<join_event> ptr;

ORBIT_RW_PROPERTY(aerys::orbit::utils::string, nickname);

join_event(aerys::orbit::utils::string nickname = std::string(""))
{
this->nickname = nickname;
}

bool will_propagate() const
{ return false; }

void deserialize(aerys::orbit::network::stream& s)
{
s >> this->nickname;
}

void serialize(aerys::orbit::network::stream& s)
{
s << this->nickname;
}
};
} } }

#endif
