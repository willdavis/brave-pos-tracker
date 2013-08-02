require "spec_helper"

describe ControlTowersController do
  describe "routing" do

    it "routes to #index" do
      get("/control_towers").should route_to("control_towers#index")
    end

    it "routes to #new" do
      get("/control_towers/new").should route_to("control_towers#new")
    end

    it "routes to #show" do
      get("/control_towers/1").should route_to("control_towers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/control_towers/1/edit").should route_to("control_towers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/control_towers").should route_to("control_towers#create")
    end

    it "routes to #update" do
      put("/control_towers/1").should route_to("control_towers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/control_towers/1").should route_to("control_towers#destroy", :id => "1")
    end

  end
end
