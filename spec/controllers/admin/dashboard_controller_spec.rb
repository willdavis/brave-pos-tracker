require 'spec_helper'

describe Admin::DashboardController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @role = FactoryGirl.create(:admin_role)
    @user.roles << @role
    sign_in @user
  end

  let(:valid_session) { {"warden.user.user.key" => session["warden.user.user.key"]} }

  describe "GET 'applications'" do
    it "returns http success" do
      get 'applications'
      response.should be_success
    end
  end

end
