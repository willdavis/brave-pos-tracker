require 'spec_helper'

describe "scouting/reports/index" do
  before(:each) do
    star = FactoryGirl.create(:star)
    user = FactoryGirl.create(:user)
    planet = FactoryGirl.create(:planet, :name => "Planet Name")
    planet2 = FactoryGirl.create(:planet, :name => "Planet Name 2")
  
    assign(:scouting_reports, [
      stub_model(Scouting::Report,
        :star_id => star.id,
        :planet_ids => "1",
        :user_id => user.id
      ),
      stub_model(Scouting::Report,
        :star_id => star.id,
        :planet_ids => "2",
        :user_id => user.id
      )
    ])
  end

  it "renders a list of scouting/reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Test Pilot", :count => 2
    assert_select "tr>td", :text => "Planet Name".to_s, :count => 1
    assert_select "tr>td", :text => "Planet Name 2".to_s, :count => 1
  end
end
