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

  describe ".star" do
    it "returns a Star object" do
      star = FactoryGirl.create(:star)
      @report.star_id = star.id
      
      @report.star.should eq(star)
    end
  end
  
  describe ".planets" do
    it "returns an Array of Planet objects" do
      planet = FactoryGirl.create(:planet, :name => "Test1")
      planet2 = FactoryGirl.create(:planet, :name => "Test2")
      
      @report.planet_ids = [planet.id,planet2.id]
      
      @report.planets.should include(planet, planet2)
    end
  end
end
