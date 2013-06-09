require 'spec_helper'

describe Scouting::ControlTower do
  before(:each) do
    @tower = FactoryGirl.create(:scouting_control_tower)
  end

  describe ".reports" do
    it "returns an Array of Report objects" do
      report = FactoryGirl.create(:scouting_report)
      @tower.reports << report
      
      @tower.reports.should include(report)
    end
  end
end
