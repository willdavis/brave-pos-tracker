require 'spec_helper'

describe "scouting/control_towers/index" do
  before(:each) do
    assign(:scouting_control_towers, [
      stub_model(Scouting::ControlTower,
        :region_id => 1,
        :constellation_id => 2,
        :solar_system_id => 3,
        :moon_id => 4,
        :control_tower_type_id => 5
      ),
      stub_model(Scouting::ControlTower,
        :region_id => 1,
        :constellation_id => 2,
        :solar_system_id => 3,
        :moon_id => 4,
        :control_tower_type_id => 5
      )
    ])
  end

  it "renders a list of scouting/control_towers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
