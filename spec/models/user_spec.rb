require 'spec_helper'

describe User do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end
  
  describe "Pilot Name" do
    it "is a string" do
      @user.pilot_name.class.should eq(String)
    end
  end
  
  describe "Role" do
    it "is a string" do
      @user.role.class.should eq(String)
    end
    
    it "is listed in the User::ROLES list" do
      User::ROLES.should include(@user.role)
    end
  end
end
