require_relative '../../automated_init'

context "Handle Commands" do
  context "Start" do
    context "Ignored" do
      handler = Handlers::Commands.new

      start = Controls::Commands::Start.example

      organization = Controls::Organization.example

      handler.store.add(organization.id, organization)

      handler.(start)

      writer = handler.write

      started = writer.one_message do |event|
        event.instance_of?(Messages::Events::Started)
      end

      test "Started Event is not Writtent" do
        assert(started.nil?)
      end
    end
  end
end
