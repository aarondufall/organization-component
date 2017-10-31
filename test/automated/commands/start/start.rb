require_relative '../../automated_init'

context "Commands" do
  context "Start" do
    organization_id = Controls::Organization.id
    name = Controls::Organization.name
    effective_time = Controls::Time::Effective::Raw.example

    start = Commands::Start.new
    start.clock.now = effective_time

    start.(organization_id: organization_id, name: name)

    write = start.write

    start_message = write.one_message do |start|
      start.instance_of?(Messages::Commands::Start)
    end

    test "Start command is written" do
      refute(start_message.nil?)
    end

    test "Written to the organization command stream" do
      written_to_stream = write.written?(start_message) do |stream_name|
        stream_name == "organization:command-#{organization_id}"
      end

      assert(written_to_stream)
    end

    context "Attributes" do
      test "organization_id is assigned" do
        assert(start_message.organization_id == organization_id)
      end

      test "name" do
        assert(start_message.name == name)
      end

      test "time" do
        effective_time_iso8601 = Clock.iso8601(effective_time)

        assert(start_message.time == effective_time_iso8601)
      end
    end
  end
end
