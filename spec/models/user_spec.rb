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
end
