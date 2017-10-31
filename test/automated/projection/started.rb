require_relative '../automated_init'

context "Projection" do
  context "Started" do
    organization = Controls::Organization::New.example

    assert(organization.started_time.nil?)

    started = Controls::Events::Started.example

    organization_id = started.organization_id or fail
    name = started.name or fail

    Projection.(organization, started)

    test "ID is set" do
      assert organization.id == organization_id
    end

    test "Name is set" do
      assert(organization.name == name)
    end

    test "Started time is converted and copied" do
      started_time = Time.parse(started.time)

      assert(organization.started_time == started_time)
    end
  end
end
