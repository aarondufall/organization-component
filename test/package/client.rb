require 'organization/client'
require 'organization/client/controls'

organization_id = Identifier::UUID::Random.get
name = Organization::Client::Controls::Organization.name

reply_stream_name = Organization::Client::Controls::StreamName::Reply.example

Organization::Client::Start.(organization_id: organization_id, name: name)

stream_name = Messaging::StreamName.stream_name(organization_id, 'organization')

sleep 1

organization_data = MessageStore::Postgres::Get::Last.(stream_name)

pp organization_data
