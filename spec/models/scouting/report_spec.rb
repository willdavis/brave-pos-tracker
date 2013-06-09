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
end
