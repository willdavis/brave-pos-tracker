require 'spec_helper'

describe "admin/roles/new" do
  before(:each) do
    assign(:admin_role, stub_model(Admin::Role,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new admin_role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_roles_path, "post" do
      assert_select "input#admin_role_name[name=?]", "admin_role[name]"
    end
  end
end
