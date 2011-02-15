#ifndef         APP_HH_
# define        APP_HH_

# include       <aerys/orbit.hh>

# include       "aerys/flashboard/shared/initializer.hh"

using namespace ::aerys::orbit;
using namespace ::aerys::flashboard::shared;

namespace aerys
{
  namespace flashboard
  {
    // The Orbit application. Automagically created.
    class app : public application::orbit_application
    {
    public:
      app(application::config&                                  config);

    private:
      // Handler called once connected.
      void
      handle_connected(network::events::connected_event::ptr    event);

      // Handler called every `tickrate' times per second.
      void
      handle_tick();

      // Handler called when a client is identified.
      void
      handle_bind(network::events::bind_event::ptr              event);

      // Handler called when a client has left.
      void
      handle_unbind(network::events::unbind_event::ptr          event);

      // Handler called when a client has entered the join.
      void
      handle_join(join_event::ptr                               event);

      // Handler called when a client moved the mouse.
      void
      handle_move(move_event::ptr                               event);

    private:
      /// Session to painter map.
      std::map< network::session::ptr, painter_entity::ptr >    m_session_to_painter;

      /// Globally shared data structure.
      utils::pool< network::network_entity::ptr >::ptr          m_pool;
    };
  }
}

#endif
