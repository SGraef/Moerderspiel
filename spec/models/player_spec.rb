require 'spec_helper'

describe Player do

  it "should know if somebodey have to kill someone mor than once" do
    user1 = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
    gamemaster = User.create(username: "Foobar", password: "123456", email: "gamemaster@bar.de")
    user2 = User.create(username: "Rumpelstielzchen", password: "123456", email: "bar@bar.de")
    game = Game.create(name: "test1", circle_count: 2, gamemaster: gamemaster)
    game.participate user1
    game.participate user2
    game.start
    game.player.each do |player|
      player.have_multi_kill?.should == true
    end
  end

end
