require 'spec_helper'

describe Scouting::Report do
  before(:each) do
    @report = FactoryGirl.create(:scouting_report)
  end

  describe ".star" do
    it "returns a Star object" do
      star = FactoryGirl.create(:star)
      @report.star_id = star.id
      
      @report.star.should eq(star)
    end
  end
end
