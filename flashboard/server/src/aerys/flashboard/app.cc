#include "app.hh"

// Magically create the main() function.
DECLARE_ORBIT_APPLICATION(aerys::flashboard::app);

namespace aerys
{
  namespace flashboard
  {
    app::app(application::config& config) :
      orbit_application(config, utils::make_shared< initializer >()),
      m_pool(new utils::pool< network::network_entity::ptr >)
    {
      m_orbit_server->ADD_EVENT_LISTENER(network::events::connected_event,      \
                                         handle_connected,                      \
                                         this);

      std::cout << name() << " server started on "
                << m_orbit_server->endpoint_address()
                << std::endl;
    }

    void
    app::handle_connected(network::events::connected_event::ptr event)
    {
      /// Connected doesn't mean the client is using the required protocol.
      /// We'll be sure when the session receives a `bind' event.

      network::session::ptr session = event->session();

      /// Listen to `bind' and `unbind' events.
      session->ADD_EVENT_LISTENER(network::events::bind_event, handle_bind, this);
      session->ADD_EVENT_LISTENER(network::events::unbind_event, handle_unbind, this);
    }

    void
    app::handle_bind(network::events::bind_event::ptr event)
    {
      network::session::ptr session = utils::as< network::session >(event->target());

      /// Now wait for a `join' event.
      session->ADD_EVENT_LISTENER(join_event, handle_join, this);
      session->ADD_EVENT_LISTENER(move_event, handle_move, this);
    }

    void
    app::handle_join(join_event::ptr event)
    {
      network::session::ptr session = utils::as< network::session >(event->target());

      /// If the session already exists,
      if (m_session_to_painter.find(session) != m_session_to_painter.end())
      {
        /// Then the player only changed its nickname.
        painter_entity::ptr painter = m_session_to_painter[session];

        painter->nickname = event->nickname;
      }
      else
      {
        // Otherwise it's a new player!

        /// Tell the session to synchronize with the global pool.
        session->entity_pool(m_pool);

        /// Create a `painter' entity.
        painter_entity::ptr painter = utils::make_shared< painter_entity >();

        painter->nickname = event->nickname;

        /// Dispatch a joined event to specify the `painter' id.
        session->dispatch_event(new joined_event(painter->id()));

        /// Set the session-to-painter link to be able to easily find the entity.
        m_session_to_painter[session] = painter;

        /// Add the `painter' to the pool.
        m_pool->add(painter);
      }
    }

    void
    app::handle_unbind(network::events::unbind_event::ptr event)
    {
      /// Get the session that dispatched the event.
      network::session::ptr session = utils::as< network::session >(event->target());

      /// Retrieve the `painter' entity.
      painter_entity::ptr painter = m_session_to_painter[session];

      /// Remove it from the pool.
      m_pool->remove(painter);

      /// remove the session-to-painter link
      m_session_to_painter[session] = 0;
    }

    void
    app::handle_move(move_event::ptr event)
    {
      /// Get the session that dispatched the event.
      network::session::ptr session = utils::as< network::session >(event->target());

      /// Retrieve the `painter' entity.
      painter_entity::ptr painter = m_session_to_painter[session];

      /// Setting the new position.
      painter->x = event->x;
      painter->y = event->y;
    }

    void
    app::handle_tick()
    {
      /// There's nothing to do here. But it might be the right place to run
      /// frequent operations like a physics simulation.
    }
  }
}
