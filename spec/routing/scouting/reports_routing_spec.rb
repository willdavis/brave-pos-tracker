require "spec_helper"

describe Scouting::ReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/scouting/reports").should route_to("scouting/reports#index")
    end

    it "routes to #new" do
      get("/scouting/reports/new").should route_to("scouting/reports#new")
    end

    it "routes to #show" do
      get("/scouting/reports/1").should route_to("scouting/reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scouting/reports/1/edit").should route_to("scouting/reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scouting/reports").should route_to("scouting/reports#create")
    end

    it "routes to #update" do
      put("/scouting/reports/1").should route_to("scouting/reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scouting/reports/1").should route_to("scouting/reports#destroy", :id => "1")
    end

  end
end
