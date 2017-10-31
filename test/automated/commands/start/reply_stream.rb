require_relative '../../automated_init'

context "Commands" do
  context "Start" do
    context "Reply Stream" do
      organization_id = Controls::Organization.id
      name = Controls::Organization.name
    

      reply_stream = 'someReplyStream'

      start = Commands::Start.new

      start.(organization_id: organization_id, name: name, reply_stream_name: reply_stream)

      write = start.write

      start_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Start)
      end

      refute(start_message.nil?)

      test "Reply stream is set" do
        assert(start_message.metadata.reply_stream_name == reply_stream)
      end
    end
  end
end
