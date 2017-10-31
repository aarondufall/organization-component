module OrganizationComponent
  module Messages
    module Commands
      class Start
        include Messaging::Message

        attribute :organization_id, String
        attribute :name, String
        attribute :time, String
      end
    end
  end
end
