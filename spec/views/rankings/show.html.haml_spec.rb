require 'spec_helper'

describe "rankings/show" do
  before(:each) do
    @ranking = assign(:ranking, stub_model(Ranking,
      :user => nil,
      :points => 1,
      :sos => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
