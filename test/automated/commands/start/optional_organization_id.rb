require_relative '../../automated_init'

context "Commands" do
  context "Withdraw" do
    context "Optional Oganization ID" do
      name = Controls::Organization.name

      context "Omitted" do
       start = Commands::Start.(name: name)

        test "An ID is assigned" do
          refute(start.organization_id.nil?)
        end
      end

      context "Supplied" do
        organization_id = Identifier::UUID::Random.get

        start = Commands::Start.(
          organization_id: organization_id,
          name: name,
        )

        test "ID is assigned to supplied ID" do
          assert(start.organization_id == organization_id)
        end
      end
    end
  end
end
