require 'spec_helper'

describe "scouting/control_towers/show" do
  before(:each) do
    @scouting_control_tower = assign(:scouting_control_tower, stub_model(Scouting::ControlTower,
      :region_id => 1,
      :constellation_id => 2,
      :solar_system_id => 3,
      :moon_id => 4,
      :control_tower_type_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
