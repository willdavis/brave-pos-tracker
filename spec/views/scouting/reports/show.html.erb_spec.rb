require 'spec_helper'

describe "scouting/reports/show" do
  before(:each) do
    star = FactoryGirl.create(:star)
    user = FactoryGirl.create(:user)
    planet = FactoryGirl.create(:planet, :name => "Planet Name")
    planet2 = FactoryGirl.create(:planet)
  
    @scouting_report = assign(:scouting_report, stub_model(Scouting::Report,
      :star_id => star.id,
      :planet_ids => "1,2",
      :user_id => user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Test Pilot/)
    rendered.should match(/Planet Name/)
    rendered.should match(/MyString/)
  end
end
