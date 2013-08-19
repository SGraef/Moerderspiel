require 'spec_helper'

describe "rankings/new" do
  before(:each) do
    assign(:ranking, stub_model(Ranking,
      :user => nil,
      :points => 1,
      :sos => 1
    ).as_new_record)
  end

  it "renders new ranking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rankings_path, "post" do
      assert_select "input#ranking_user[name=?]", "ranking[user]"
      assert_select "input#ranking_points[name=?]", "ranking[points]"
      assert_select "input#ranking_sos[name=?]", "ranking[sos]"
    end
  end
end
