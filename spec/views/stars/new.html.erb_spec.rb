require 'spec_helper'

describe "stars/new" do
  before(:each) do
    assign(:star, stub_model(Star,
      :name => "MyString",
      :security => "9.99",
      :gate_count => 1
    ).as_new_record)
  end

  it "renders new star form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stars_path, "post" do
      assert_select "input#star_name[name=?]", "star[name]"
      assert_select "input#star_security[name=?]", "star[security]"
      assert_select "input#star_gate_count[name=?]", "star[gate_count]"
    end
  end
end
