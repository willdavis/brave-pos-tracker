require 'spec_helper'

describe "scouting/reports/show" do
  before(:each) do
    user = FactoryGirl.create(:user)
  
    @scouting_report = assign(:scouting_report, stub_model(Scouting::Report,
      :star_id => 1,
      :user_id => user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Test Pilot/)
    rendered.should match(/1/)
  end
end
