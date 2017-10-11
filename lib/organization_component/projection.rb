module OrganizationComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :organization

    # TODO Implement event projection blocks
    # eg:
    # apply SomethingHappened do |something_happened|
    #   SetAttributes.(organization, something_happened, copy: [
    #     { :organization_id => :id }
    #   ])

    #   something_happened_time = Clock.parse(something_happened.time)

    #   organization.something_happened_time = something_happened_time
    # end
  end
end
