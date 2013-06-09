require 'spec_helper'

describe "scouting/reports/index" do
  before(:each) do
    user = FactoryGirl.create(:user)
  
    assign(:scouting_reports, [
      stub_model(Scouting::Report,
        :star_id => 1,
        :user_id => user.id
      ),
      stub_model(Scouting::Report,
        :star_id => 2,
        :user_id => user.id
      )
    ])
  end

  it "renders a list of scouting/reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Test Pilot", :count => 2
  end
end
