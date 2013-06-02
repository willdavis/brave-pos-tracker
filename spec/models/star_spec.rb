require 'spec_helper'

describe Star do
  before(:each) do
    @star = FactoryGirl.create(:star)
  end

  describe "Name" do
    it "is a String" do
      @star.name.class.should eq(String)
    end
  end
  
  describe "Security" do
    it "is a BigDecimal" do
      @star.security.class.should eq(BigDecimal)
    end
  end
  
  describe "Gate count" do
    it "is a Fixnum" do
      @star.gate_count.class.should eq(Fixnum)
    end
  end
end
