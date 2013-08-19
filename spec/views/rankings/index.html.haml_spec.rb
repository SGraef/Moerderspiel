require 'spec_helper'

describe "rankings/index" do
  before(:each) do
    assign(:rankings, [
      stub_model(Ranking,
        :user => nil,
        :points => 1,
        :sos => 2
      ),
      stub_model(Ranking,
        :user => nil,
        :points => 1,
        :sos => 2
      )
    ])
  end

  it "renders a list of rankings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
