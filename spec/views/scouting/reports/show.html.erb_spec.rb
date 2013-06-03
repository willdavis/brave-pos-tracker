require 'spec_helper'

describe "scouting/reports/show" do
  before(:each) do
    @scouting_report = assign(:scouting_report, stub_model(Scouting::Report,
      :star_id => 1,
      :planet_ids => "Planet Ids"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Planet Ids/)
  end
end
