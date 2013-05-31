require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'waiting'" do
    it "returns http success" do
      get 'waiting_room'
      response.should be_success
    end
  end

end
