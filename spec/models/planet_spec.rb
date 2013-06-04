require 'spec_helper'

describe Planet do
  describe ".star" do
    it "returns a Star object" do
      star = FactoryGirl.create(:star)
      planet = FactoryGirl.create(:planet)
      
      star.planets << planet
      
      planet.star.should eq(star)
      star.planets.should include(planet)
    end
  end
end
