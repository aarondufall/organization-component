require_relative '../../automated_init'

context 'Handle Commands' do
  context 'Start' do
    context 'Expected Version' do
      handler = Handlers::Commands.new

      start = Controls::Commands::Start.example

      organization = Controls::Organization.example

      version = Controls::Version.example

      handler.(start)

      writer = handler.write

      started = writer.one_message do |event|
        event.instance_of?(Messages::Events::Started)
      end

      test "Is entity version" do
        written_to_stream = writer.written?(started) do |_, expected_version|
          expected_version = version
        end

        assert(written_to_stream)
      end
    end
  end
end
