require 'spec_helper'

describe "stars/edit" do
  before(:each) do
    @star = assign(:star, stub_model(Star,
      :name => "MyString",
      :security => "9.99",
      :gate_count => 1
    ))
  end

  it "renders the edit star form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", star_path(@star), "post" do
      assert_select "input#star_name[name=?]", "star[name]"
      assert_select "input#star_security[name=?]", "star[security]"
      assert_select "input#star_gate_count[name=?]", "star[gate_count]"
    end
  end
end
