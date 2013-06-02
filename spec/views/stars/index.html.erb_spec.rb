require 'spec_helper'

describe "stars/index" do
  before(:each) do
    assign(:stars, [
      stub_model(Star,
        :name => "Name",
        :security => "9.99",
        :gate_count => 1
      ),
      stub_model(Star,
        :name => "Name",
        :security => "9.99",
        :gate_count => 1
      )
    ])
  end

  it "renders a list of stars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
