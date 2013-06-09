require 'spec_helper'

describe Scouting::Report do
  before(:each) do
    @report = FactoryGirl.create(:scouting_report)
  end
  
  describe ".user" do
    it "returns a User object" do
      user = FactoryGirl.create(:user)
      @report.user_id = user.id
      
      @report.user.should eq(user)
    end
  end
  
  describe ".control_towers" do
    it "returns an Array of Control Tower objects" do
      tower = FactoryGirl.create(:scouting_control_tower)
      @report.control_towers << tower
      
      @report.control_towers.should include(tower)
    end
  end
end
