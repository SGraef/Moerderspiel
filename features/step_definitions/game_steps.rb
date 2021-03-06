Angenommen(/^Es existiert ein Nutzer der angemeldet ist$/) do
  @user = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
  visit login_path
  fill_in 'password', with: '123456'
  fill_in 'username', with: @user.username
  click_button "Anmelden"
  page.should have_content(@user.username)
  page.should have_content("Abmelden")
end

Wenn(/^dieser dann die Seite zum Spiel erstellen besucht$/) do
  click_link "Neues Spiel erstellen"
end

Wenn(/^dieser dann ein Spiel erstellt mit "(.*?)" Kreisen erstellt$/) do |count|
  fill_in 'game_name', with: "test1"
  fill_in "game_circle_count", with: 2
  check "game_tweet" 
  click_button "Abschicken"
end

Dann(/^Existiert ein Spiel mit "(.*?)" Kreisen$/) do |count|
  @game = Game.first
  @game.should_not == nil
  @game.circles.size.should == count.to_i
end

Dann(/^er ist Gamemaster dieses Spiels$/) do
  @game.gamemaster.equal? @user 
end

Angenommen(/^ein Spiel bei dem er nicht Gamemaster ist$/) do
  user = User.create(username: "Foobar", password: "123456", email: "fooo@bar.de")
  @game = Game.create(name: "test1", circle_count: 2, gamemaster: user)
end

Wenn(/^dieser dann dem Spiel beitritt$/) do
  @game.participate(@user)
end

Dann(/^ist er als Mitspieler registriert$/) do
  @game.player.first.should.equal? @user
end

Angenommen(/^es Existiert ein Laufendes Spiel mit mehreren Spielern$/) do
  @u1 = FactoryGirl.create :user
  @u2 = FactoryGirl.create :user
  gm = FactoryGirl.create :user
  @game = Game.create(name: "test1", circle_count: 2, gamemaster: gm)
  @game.participate(@u1)
  @game.participate(@u2)
  @game.start
end

Wenn(/^ein registrierter Nutzer dann einen Mord einträgt$/) do
  @player = @game.player.first
  job = @player.get_jobs.first
  time = Time.now
  job.kill("Tot", {hour: time.hour, minute: time.min, year: time.year, month: time.mon, day: time.day})
end

Dann(/^hat er einen erfolgreichen Mord$/) do
  job = Job.where(killer: @player, status:"done").first
  job.should_not == nil
end