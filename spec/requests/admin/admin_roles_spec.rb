require 'spec_helper'

describe "Admin::Roles" do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "GET /admin_roles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_roles_path
      response.status.should be(200)
    end
  end
end
