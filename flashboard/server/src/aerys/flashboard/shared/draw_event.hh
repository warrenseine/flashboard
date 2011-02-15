#ifndef EVENT_33_HH_
# define EVENT_33_HH_

# include "aerys/orbit/network/events/network_event.hh"
# include "aerys/orbit/utils/const.hh"
# include "aerys/orbit/utils/property.hh"
# include "aerys/orbit/utils/ptr.hh"
# include "aerys/orbit/utils/boolean.hh"
# include "aerys/orbit/utils/integer.hh"
# include "aerys/orbit/utils/float.hh"
# include "aerys/orbit/utils/string.hh"

namespace aerys { namespace flashboard { namespace shared {
struct draw_event : aerys::orbit::network::events::network_event
{
ORBIT_CLASS_ID(33);
typedef aerys::orbit::utils::ptr<draw_event> ptr;

ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, from_x);
ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, from_y);
ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, to_x);
ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, to_y);
ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, brush);
ORBIT_RW_PROPERTY(aerys::orbit::utils::uint32, color);
ORBIT_RW_PROPERTY(aerys::orbit::utils::uint32, size);

draw_event(aerys::orbit::utils::int16 from_x = 0, aerys::orbit::utils::int16 from_y = 0, aerys::orbit::utils::int16 to_x = 0, aerys::orbit::utils::int16 to_y = 0, aerys::orbit::utils::int16 brush = 0, aerys::orbit::utils::uint32 color = 0u, aerys::orbit::utils::uint32 size = 0u)
{
this->from_x = from_x;
this->from_y = from_y;
this->to_x = to_x;
this->to_y = to_y;
this->brush = brush;
this->color = color;
this->size = size;
}

bool will_propagate() const
{ return true; }

void deserialize(aerys::orbit::network::stream& s)
{
s >> this->from_x >> this->from_y >> this->to_x >> this->to_y >> this->brush >> this->color >> this->size;
}

void serialize(aerys::orbit::network::stream& s)
{
s << this->from_x << this->from_y << this->to_x << this->to_y << this->brush << this->color << this->size;
}
};
} } }

#endif
