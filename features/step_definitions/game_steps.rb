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
  pending # express the regexp above with the code you wish you had
end

Dann(/^ist er als Mitspieler registriert$/) do
  pending # express the regexp above with the code you wish you had
end
