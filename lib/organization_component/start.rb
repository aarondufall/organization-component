module OrganizationComponent
  module Start
    def self.call
      Consumers::Commands.start('organization:command')
      Consumers::Events.start('organization')
    end
  end
end
