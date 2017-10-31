module OrganizationComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :organization

      handle Start do |start|
        organization_id = start.organization_id

        organization, version = store.fetch(organization_id, include: :version)

        if organization.started?
          logger.info(tag: :ignored) { "Command ignored (Command: #{start.message_type}, Organization ID: #{organization_id})" }
          return
        end

        started = Started.follow(start)

        started.processed_time = clock.iso8601

        stream_name = stream_name(organization_id)

        write.(started, stream_name, expected_version: version)
      end
    end
  end
end
