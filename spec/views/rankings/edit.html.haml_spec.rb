require 'spec_helper'

describe "rankings/edit" do
  before(:each) do
    @ranking = assign(:ranking, stub_model(Ranking,
      :user => nil,
      :points => 1,
      :sos => 1
    ))
  end

  it "renders the edit ranking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ranking_path(@ranking), "post" do
      assert_select "input#ranking_user[name=?]", "ranking[user]"
      assert_select "input#ranking_points[name=?]", "ranking[points]"
      assert_select "input#ranking_sos[name=?]", "ranking[sos]"
    end
  end
end
