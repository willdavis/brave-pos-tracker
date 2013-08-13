require 'spec_helper'

describe "ControlTowers" do
  describe "GET /control_towers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get control_towers_path
      response.status.should be(200)
    end
  end
end
