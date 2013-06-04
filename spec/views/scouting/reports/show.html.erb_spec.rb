require 'spec_helper'

describe "scouting/reports/show" do
  before(:each) do
    star = FactoryGirl.create(:star)
    user = FactoryGirl.create(:user)
  
    @scouting_report = assign(:scouting_report, stub_model(Scouting::Report,
      :star_id => star.id,
      :planet_ids => "Planet Ids",
      :user_id => user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Test Pilot/)
    rendered.should match(/Planet Ids/)
  end
end
