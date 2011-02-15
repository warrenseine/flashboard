#ifndef ENTITY_32_HH_
# define ENTITY_32_HH_

# include "aerys/orbit/network/network_entity.hh"
# include "aerys/orbit/utils/property.hh"
# include "aerys/orbit/utils/const.hh"
# include "aerys/orbit/utils/ptr.hh"
# include "aerys/orbit/utils/integer.hh"
# include "aerys/orbit/utils/float.hh"
# include "aerys/orbit/utils/string.hh"

namespace aerys { namespace flashboard { namespace shared {
struct painter_entity : aerys::orbit::network::network_entity
{
ORBIT_CLASS_ID(32);
typedef aerys::orbit::utils::ptr<painter_entity> ptr;
ORBIT_CONST(aerys::orbit::utils::uint32, c_size, 4);

ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, x);
ORBIT_RW_PROPERTY(aerys::orbit::utils::int16, y);
ORBIT_RW_PROPERTY(aerys::orbit::utils::string, nickname);

painter_entity(aerys::orbit::utils::int16 x = 0, aerys::orbit::utils::int16 y = 0, aerys::orbit::utils::string nickname = std::string(""))
{
this->x = x;
this->y = y;
this->nickname = nickname;
}

void serialize(aerys::orbit::network::stream& s) const
{
s << this->x << this->y << this->nickname;
}

bool has_changed() const
{
return false || x.has_changed() || y.has_changed() || nickname.has_changed();
}

void reset_state()
{
x.reset_state();
y.reset_state();
nickname.reset_state();
}
};
} } }
#endif
