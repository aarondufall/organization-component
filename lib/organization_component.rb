require 'eventide/postgres'

require 'organization_component/load'

require 'organization_component/organization'
require 'organization_component/projection'
require 'organization_component/store'

require 'organization_component/handlers/commands'
require 'organization_component/handlers/events'

require 'organization_component/consumers/commands'
require 'organization_component/consumers/events'

require 'organization_component/start'
