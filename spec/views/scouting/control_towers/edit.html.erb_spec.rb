require 'spec_helper'

describe "scouting/control_towers/edit" do
  before(:each) do
    @scouting_control_tower = assign(:scouting_control_tower, stub_model(Scouting::ControlTower,
      :region_id => 1,
      :constellation_id => 1,
      :solar_system_id => 1,
      :moon_id => 1,
      :control_tower_type_id => 1
    ))
  end

  it "renders the edit scouting_control_tower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", scouting_control_tower_path(@scouting_control_tower), "post" do
      assert_select "input#scouting_control_tower_region_id[name=?]", "scouting_control_tower[region_id]"
      assert_select "input#scouting_control_tower_constellation_id[name=?]", "scouting_control_tower[constellation_id]"
      assert_select "input#scouting_control_tower_solar_system_id[name=?]", "scouting_control_tower[solar_system_id]"
      assert_select "input#scouting_control_tower_moon_id[name=?]", "scouting_control_tower[moon_id]"
      assert_select "input#scouting_control_tower_control_tower_type_id[name=?]", "scouting_control_tower[control_tower_type_id]"
    end
  end
end
