require 'spec_helper'

describe "planets/edit" do
  before(:each) do
    @planet = assign(:planet, stub_model(Planet,
      :name => "MyString",
      :asteroid_belt_count => 1,
      :poco_owner_id => 1
    ))
  end

  it "renders the edit planet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", planet_path(@planet), "post" do
      assert_select "input#planet_name[name=?]", "planet[name]"
      assert_select "input#planet_asteroid_belt_count[name=?]", "planet[asteroid_belt_count]"
      assert_select "input#planet_poco_owner_id[name=?]", "planet[poco_owner_id]"
    end
  end
end
