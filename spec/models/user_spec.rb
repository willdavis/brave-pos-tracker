require 'spec_helper'

describe User do
  before(:all) do
    @user = FactoryGirl.create(:user)
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
