module OrganizationComponent
  module Controls
    module Organization
      def self.example
        organization = OrganizationComponent::Organization.build

        organization.id = self.id
        organization.name = self.name
        organization.started_time = Time::Effective::Raw.example

        organization
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.name
        'some_organization_name'
      end

      def self.id_increment
        1111
      end

      module New
        def self.example
          OrganizationComponent::Organization.build
        end
      end

      module Started
        def self.example
          Organization.example
        end
      end

      module Identified
        def self.example
          organization = New.example
          organization.id = Organization.id
          organization
        end
      end
    end
  end
end
