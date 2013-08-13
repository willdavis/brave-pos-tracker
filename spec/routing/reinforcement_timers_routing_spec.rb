require "spec_helper"

describe ReinforcementTimersController do
  describe "routing" do

    it "routes to #index" do
      get("/reinforcement_timers").should route_to("reinforcement_timers#index")
    end

    it "routes to #new" do
      get("/reinforcement_timers/new").should route_to("reinforcement_timers#new")
    end

    it "routes to #show" do
      get("/reinforcement_timers/1").should route_to("reinforcement_timers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reinforcement_timers/1/edit").should route_to("reinforcement_timers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reinforcement_timers").should route_to("reinforcement_timers#create")
    end

    it "routes to #update" do
      put("/reinforcement_timers/1").should route_to("reinforcement_timers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reinforcement_timers/1").should route_to("reinforcement_timers#destroy", :id => "1")
    end

  end
end
