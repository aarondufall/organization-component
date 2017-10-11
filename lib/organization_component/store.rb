module OrganizationComponent
  class Store
    include EntityStore

    category :organization
    entity Organization
    projection Projection
    reader MessageStore::Postgres::Read
  end
end
