require 'spec_helper'

describe "planets/show" do
  before(:each) do
    star = FactoryGirl.create(:star)
    @planet = assign(:planet, stub_model(Planet,
      :name => "Name",
      :asteroid_belt_count => 1,
      :ice_belt_count => 2,
      :poco_owner_id => 3
    ))
    star.planets << @planet
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
