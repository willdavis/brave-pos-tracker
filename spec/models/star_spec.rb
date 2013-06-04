require 'spec_helper'

describe Star do
  before(:each) do
    @star = FactoryGirl.create(:star)
  end
  
  describe ".planets" do
    it "returns an Array of Planet objects" do
      planet1 = FactoryGirl.create(:planet)
      planet2 = FactoryGirl.create(:planet, :name => "test2")
      
      @star.planets << [planet1, planet2]
      @star.planets.should include(planet1, planet2)
    end
  end

  describe ".name" do
    it "is a String" do
      @star.name.class.should eq(String)
    end
  end
  
  describe ".security" do
    it "is a BigDecimal" do
      @star.security.class.should eq(BigDecimal)
    end
  end
  
  describe ".gate_count" do
    it "is a Fixnum" do
      @star.gate_count.class.should eq(Fixnum)
    end
  end
end
