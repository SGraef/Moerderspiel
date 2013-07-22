require 'spec_helper'

describe Game do
  it "should be possible to play as registerd user in a game" do
    user = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
    gamemaster = User.create(username: "Foobar", password: "123456", email: "gamemaster@bar.de")
    game = Game.create(name: "test1", circle_count: 2, gamemaster: gamemaster)
    game.participate(user)
    game.player.should include user
  end
end
