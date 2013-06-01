require 'spec_helper'

describe "admin/roles/index" do
  before(:each) do
    assign(:admin_roles, [
      stub_model(Admin::Role,
        :name => "Name"
      ),
      stub_model(Admin::Role,
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin/roles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
