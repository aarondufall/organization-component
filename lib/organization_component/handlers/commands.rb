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

      # TODO Implement command handler block
      # eg:
      # handle DoSomething do |do_something|
      #   organization_id = do_something.organization_id

      #   organization, version = store.fetch(organization_id, include: :version)

      #   if organization.something_happened?
      #     logger.info(tag: :ignored) { "Command ignored (Command: #{do_something.message_type}, Organization ID: #{organization_id})" }
      #     return
      #   end

      #   something_happened = SomethingHappened.follow(do_something)

      #   something_happened.processed_time = clock.iso8601

      #   stream_name = stream_name(organization_id)

      #   write.(something_happened, stream_name, expected_version: version)
      # end
    end
  end
end
