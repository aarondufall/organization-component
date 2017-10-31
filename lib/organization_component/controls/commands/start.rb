module OrganizationComponent
  module Controls
    module Commands
      module Start
        def self.example
          start = OrganizationComponent::Messages::Commands::Start.build

          start.organization_id = Organization.id
          start.name = Organization.name
          start.time = Controls::Time::Effective.example

          start
        end
      end
    end
  end
end
