require 'spec_helper'

describe "stars/show" do
  before(:each) do
    @star = assign(:star, stub_model(Star,
      :name => "Name",
      :security => "9.99",
      :gate_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
