#ifndef AERYS_FLASHBOARD_SHARED_INITIALIZER_HH
#define AERYS_FLASHBOARD_SHARED_INITIALIZER_HH

#include <aerys/orbit/network/factory.hh>
#include <aerys/orbit/network/initializer.hh>

#include "draw_event.hh"
#include "join_event.hh"
#include "joined_event.hh"
#include "move_event.hh"
#include "painter_entity.hh"

namespace aerys { namespace flashboard { namespace shared {
struct initializer : aerys::orbit::network::initializer
{
std::string protocol_hash() const { return "f1d1fd399c0c24d51fc19205247b0912"; }

void register_events()
{
using aerys::orbit::network::factory;
factory::register_event<draw_event>();
factory::register_event<join_event>();
factory::register_event<joined_event>();
factory::register_event<move_event>();
}
void register_entities()
{
using aerys::orbit::network::factory;
// factory::register_entity<painter_entity>();
}
};
} } }

#endif
