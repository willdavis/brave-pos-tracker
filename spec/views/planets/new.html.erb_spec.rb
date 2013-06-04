require 'spec_helper'

describe "planets/new" do
  before(:each) do
    assign(:planet, stub_model(Planet,
      :name => "MyString",
      :asteroid_belt_count => 1,
      :poco_owner_id => 1
    ).as_new_record)
  end

  it "renders new planet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", planets_path, "post" do
      assert_select "input#planet_name[name=?]", "planet[name]"
      assert_select "input#planet_asteroid_belt_count[name=?]", "planet[asteroid_belt_count]"
      assert_select "input#planet_poco_owner_id[name=?]", "planet[poco_owner_id]"
    end
  end
end
