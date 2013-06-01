require 'spec_helper'

describe "admin/roles/show" do
  before(:each) do
    @admin_role = assign(:admin_role, stub_model(Admin::Role,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
