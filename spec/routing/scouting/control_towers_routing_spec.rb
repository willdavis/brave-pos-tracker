require "spec_helper"

describe Scouting::ControlTowersController do
  describe "routing" do

    it "routes to #index" do
      get("/scouting/control_towers").should route_to("scouting/control_towers#index")
    end

    it "routes to #new" do
      get("/scouting/control_towers/new").should route_to("scouting/control_towers#new")
    end

    it "routes to #show" do
      get("/scouting/control_towers/1").should route_to("scouting/control_towers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scouting/control_towers/1/edit").should route_to("scouting/control_towers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scouting/control_towers").should route_to("scouting/control_towers#create")
    end

    it "routes to #update" do
      put("/scouting/control_towers/1").should route_to("scouting/control_towers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scouting/control_towers/1").should route_to("scouting/control_towers#destroy", :id => "1")
    end

  end
end
