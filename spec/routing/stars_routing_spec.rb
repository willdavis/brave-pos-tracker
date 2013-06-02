require "spec_helper"

describe StarsController do
  describe "routing" do

    it "routes to #index" do
      get("/stars").should route_to("stars#index")
    end

    it "routes to #new" do
      get("/stars/new").should route_to("stars#new")
    end

    it "routes to #show" do
      get("/stars/1").should route_to("stars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stars/1/edit").should route_to("stars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stars").should route_to("stars#create")
    end

    it "routes to #update" do
      put("/stars/1").should route_to("stars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stars/1").should route_to("stars#destroy", :id => "1")
    end

  end
end
