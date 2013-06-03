require 'spec_helper'

describe "scouting/reports/edit" do
  before(:each) do
    @scouting_report = assign(:scouting_report, stub_model(Scouting::Report,
      :star_id => 1,
      :planet_ids => "MyString"
    ))
  end

  it "renders the edit scouting_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", scouting_report_path(@scouting_report), "post" do
      assert_select "input#scouting_report_star_id[name=?]", "scouting_report[star_id]"
      assert_select "input#scouting_report_planet_ids[name=?]", "scouting_report[planet_ids]"
    end
  end
end
