module OrganizationComponent
  class Organization
    include Schema::DataStructure

    attribute :id, String
    attribute :name, String
    attribute :started_time, Time

    def started?
      !started_time.nil?
    end
  end
end
