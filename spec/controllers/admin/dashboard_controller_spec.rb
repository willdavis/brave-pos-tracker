require 'spec_helper'

describe Admin::DashboardController do

  before(:each) do
    @user = FactoryGirl.create(:user)
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
