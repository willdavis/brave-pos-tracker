require 'spec_helper'

describe "Admin::Roles" do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "GET /admin_roles" do
    
  end
end
