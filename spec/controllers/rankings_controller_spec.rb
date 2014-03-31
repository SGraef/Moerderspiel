require 'spec_helper'


describe RankingsController do
  setup do
    @user = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
    @player = Player.create(user: @user)
  end
  # This should return the minimal set of attributes required to create a valid
  # Ranking. As you add validations to Ranking, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "player" => @player } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RankingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all rankings as @rankings" do
      ranking = Ranking.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rankings).should eq([ranking])
    end
  end
end
