require_relative '../../automated_init'

context "Commands" do
  context "start" do
    context "Previous Message" do
      previous_message = Controls::Message.example

      organization_id = Controls::Organization.id
      name = Controls::Organization.name

      start = Commands::Start.new
      start.clock.now = Controls::Time::Raw.example

      start.(organization_id: organization_id, name: name, previous_message: previous_message)

      write = start.write

      start_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Start)
      end

      refute(start_message.nil?)

      test "Start message follows previous message" do
        assert(start_message.follows?(previous_message))
      end
    end
  end
end
