module OrganizationComponent
  module Controls
    module Events
      module Started
        def self.example
          started = OrganizationComponent::Messages::Events::Started.build

          started.organization_id = Organization.id
          started.name = Organization.name
          started.time = Controls::Time::Effective.example
          started.processed_time = Controls::Time::Processed.example

          started
        end
      end
    end
  end
end
