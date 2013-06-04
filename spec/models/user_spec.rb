require 'spec_helper'

describe User do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end
  
  describe ".scouting_reports" do
    it "returns an Array of Report objects" do
      report1 = FactoryGirl.create(:scouting_report)
      report2 = FactoryGirl.create(:scouting_report)
      
      @user.scouting_reports << [report1, report2]
      
      @user.scouting_reports.should include(report1, report2)
    end
  end
  
  describe ".pilot_name" do
    it "is a string" do
      @user.pilot_name.class.should eq(String)
    end
  end
  
  describe ".roles" do
    it "can have many Roles" do
      role1 = Admin::Role.new(:name => "test1")
      role2 = Admin::Role.new(:name => "test2")
      @user.roles << [role1, role2]
      @user.roles.should include(role1, role2)
    end
  end
end
