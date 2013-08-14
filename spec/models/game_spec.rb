require 'spec_helper'

describe Game do
  
  before :all do
    gamemaster = User.create(username: "Foobar", password: "123456", email: "gamemaster@bar.de")
    @game = Game.create(name: "test1", circle_count: 2, gamemaster: gamemaster)
  end
  
  it "should be possible to play as registerd user in a game" do
    user = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
    @game.participate(user)
    @game.player.first.should.equal?  user
  end
  
  it "should generate the jobs when a game starts" do
    user1 = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
    user2 = User.create(username: "Rumpelstielzchen", password: "123456", email: "bar@bar.de")
    @game.participate user1
    @game.participate user2
    @game.start
    @game.player.each do |player|
      player.get_jobs.size.should == 2
    end
  end
  
  it "should be possible to play as unregistered user in a game" do
    @game.participate(nil, "Fool", "Snow-Mow@example.com")
    @game.player.where(name: "Fool", email: "Snow-Mow@example.com").size.should_not == 0
  end
end
