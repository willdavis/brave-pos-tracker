require 'spec_helper'

describe "Scouting::Reports" do
  describe "GET /scouting_reports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get scouting_reports_path
      response.status.should be(200)
    end
  end
end
