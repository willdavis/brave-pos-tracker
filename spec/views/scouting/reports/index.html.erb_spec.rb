require 'spec_helper'

describe "scouting/reports/index" do
  before(:each) do
    assign(:scouting_reports, [
      stub_model(Scouting::Report,
        :star_id => 1,
        :planet_ids => "Planet Ids"
      ),
      stub_model(Scouting::Report,
        :star_id => 1,
        :planet_ids => "Planet Ids"
      )
    ])
  end

  it "renders a list of scouting/reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Planet Ids".to_s, :count => 2
  end
end
