# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gamemaster =  User.create(username: "gamemaster", password: "123456", email: "gamemaster@example.com")
user1 =  User.create(username: "jim", password: "123456", email: "jim@example.com")
user2 = User.create(username: "john", password: "123456", email: "john@bar.de")
game = Game.create(name: "test1", circle_count: 2, gamemaster: gamemaster, starttime: Time.now, endtime: (Time.now+2.month),status: "open")
game.participate(user1)
game.participate(user2)
game.participate(nil, "sam", "sam@example.com")

game = Game.create(name: "test2", circle_count: 2, gamemaster: gamemaster, starttime: Time.now, endtime: (Time.now+2.month),status: "open")
game.participate(user1)
game.participate(user2)
game.participate(nil, "sam", "sam@example.com")
game.start

game = Game.create(name: "test3", circle_count: 2, gamemaster: gamemaster, starttime: Time.now, endtime: (Time.now+2.month),status: "open")
game.participate(user1)
game.participate(user2)
game.participate(nil, "sam", "sam@example.com")
game.start
game.end_game