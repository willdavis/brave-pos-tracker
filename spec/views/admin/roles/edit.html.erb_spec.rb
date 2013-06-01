require 'spec_helper'

describe "admin/roles/edit" do
  before(:each) do
    @admin_role = assign(:admin_role, stub_model(Admin::Role,
      :name => "MyString"
    ))
  end

  it "renders the edit admin_role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_role_path(@admin_role), "post" do
      assert_select "input#admin_role_name[name=?]", "admin_role[name]"
    end
  end
end
