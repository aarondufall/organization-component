module OrganizationComponent
  module Messages
    module Events
      class Started
        include Messaging::Message

        attribute :organization_id, String
        attribute :name, String
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
