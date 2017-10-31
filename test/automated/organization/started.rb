require_relative '../automated_init'

context "Organization" do
  context "Has Started Time" do
    organization = Controls::Organization::Started.example

    test "Is open" do
      assert(organization.started?)
    end
  end

  context "Does not Have Started Time" do
    organization = Controls::Organization::New.example

    test "Is not opened" do
      refute(organization.started?)
    end
  end
end
