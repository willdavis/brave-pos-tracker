require 'spec_helper'

describe Admin::DashboardController do

  describe "GET 'applications'" do
    it "returns http success" do
      get 'applications'
      response.should be_success
    end
  end

end
