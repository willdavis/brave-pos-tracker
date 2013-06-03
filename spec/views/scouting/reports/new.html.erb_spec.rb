require 'spec_helper'

describe "scouting/reports/new" do
  before(:each) do
    assign(:scouting_report, stub_model(Scouting::Report,
      :star_id => 1,
      :planet_ids => "MyString"
    ).as_new_record)
  end

  it "renders new scouting_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", scouting_reports_path, "post" do
      assert_select "input#scouting_report_star_id[name=?]", "scouting_report[star_id]"
      assert_select "input#scouting_report_planet_ids[name=?]", "scouting_report[planet_ids]"
    end
  end
end
