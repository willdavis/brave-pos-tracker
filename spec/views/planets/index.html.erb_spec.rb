require 'spec_helper'

describe "planets/index" do
  before(:each) do
    assign(:planets, [
      stub_model(Planet,
        :name => "Name",
        :asteroid_belt_count => 1,
        :poco_owner_id => 2
      ),
      stub_model(Planet,
        :name => "Name",
        :asteroid_belt_count => 1,
        :poco_owner_id => 2
      )
    ])
  end

  it "renders a list of planets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
