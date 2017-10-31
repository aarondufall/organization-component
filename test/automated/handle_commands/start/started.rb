require_relative '../../automated_init'

context "Handle Commands" do
  context "Open" do
    context "Opened" do
      handler = Handlers::Commands.new

      processed_time = Controls::Time::Processed::Raw.example

      handler.clock.now = processed_time

      start = Controls::Commands::Start.example

      organization_id = start.organization_id or fail
      name = start.name or fail
      effective_time = start.time or fail

      handler.(start)

      writer = handler.write

      started = writer.one_message do |event|
        event.instance_of?(Messages::Events::Started)
      end

      test "Started Event is Written" do
        refute(started.nil?)
      end

      test "Written to the organization stream" do
        written_to_stream = writer.written?(started) do |stream_name|
          stream_name == "organization-#{organization_id}"
        end

        assert(written_to_stream)
      end

      context "Attributes" do
        test "organization_id" do
          assert(started.organization_id == organization_id)
        end

        test "name" do
          assert(started.name == name)
        end

        test "time" do
          assert(started.time == effective_time)
        end

        test "processed_time" do
          processed_time_iso8601 = Clock::UTC.iso8601(processed_time)

          assert(started.processed_time == processed_time_iso8601)
        end
      end
    end
  end
end
