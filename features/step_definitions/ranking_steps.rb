Angenommen(/^Es existiert ein Spiel an dem mehrere Spieler Teilnehmen$/) do
  @gamemaster = User.create(username: "Foobar", password: "123456", email: "fooo@bar.de")
  @game = FactoryGirl.create :game_with_user
  @game.update_attributes(gamemaster: @gamemaster)
  @game.start
  visit login_path
  fill_in 'password', with: '123456'
  fill_in 'username', with: @gamemaster.username
  click_button "Anmelden"
  page.should have_content(@gamemaster.username)
  page.should have_content("Abmelden")
end

Angenommen(/^in dem Spiel wurd gemordet$/) do
  @jobs = Job.where(circle: @game.circles.first)
  time = Time.now
  @jobs.first.kill("killing for test", {hour: time.hour, minute: time.min, year: time.year, month: time.mon, day: time.day})
end

Wenn(/^ich das Spiel als Gamemaster Beende$/) do
  visit gamemaster_path
  save_and_open_page
  click_link "Spiel Beenden"
end

Dann(/^Werden die Punkte Berechnet$/) do
  pending # express the regexp above with the code you wish you had
end

Dann(/^ein Ranking für alle Registrierten Spieler Erstellt$/) do
  pending # express the regexp above with the code you wish you had
end