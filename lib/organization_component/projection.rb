module OrganizationComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :organization

    apply Started do |started|
      SetAttributes.(organization, started, copy: [
        { :organization_id => :id },
        :name
      ])

      started_time = Clock.parse(started.time)

      organization.started_time = started_time
    end
  end
end
