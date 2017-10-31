module OrganizationComponent
  module Commands
    class Start
      include Command

      def self.configure(receiver, attr_name: nil)
        attr_name ||= :withdraw
        instance = build
        receiver.public_send("#{attr_name}=", instance)
      end

      def self.call(organization_id: nil, name:, reply_stream_name: nil, previous_message: nil)
        organization_id ||= Identifier::UUID::Random.get
        instance = self.build
        instance.(organization_id: organization_id, name: name, reply_stream_name: reply_stream_name, previous_message: previous_message)
      end

      def call(organization_id:, name:, reply_stream_name: nil, previous_message: nil)
        start = self.class.build_message(Messages::Commands::Start, previous_message)

        start.organization_id = organization_id
        start.name = name
        start.time = clock.iso8601

        stream_name = command_stream_name(organization_id)

        write.(start, stream_name, reply_stream_name: reply_stream_name)

        start
      end
    end
  end
end
