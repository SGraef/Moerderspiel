Angenommen(/^ich rufe die Webseite auf$/) do
  visit root_path
  page.should_not have_content("Abmelden")
  page.should have_content("Registrieren")
end

Wenn(/^ich dann auf den Link für das Registrieren klicke$/) do
  click_link "Registrieren"
end

Wenn(/^dann das Registrierungsformular ausfülle$/) do
  fill_in 'user_name', with: 'bar'
  fill_in 'user_surname', with: 'foo'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  fill_in 'user_username', with: 'Banane'
  fill_in 'user_email', with: 'foo@bar.de'
end

Wenn(/^es Abschicke$/) do
  click_button "Abschicken"
end

Dann(/^Existiert ein Nutzer mit meinen Angaben$/) do
  @user = User.where(username: "Banane").first
  @user.name.should == "bar"
  @user.surname.should == "foo"
  @user.email.should == "foo@bar.de" 
end

Angenommen(/^es existiert ein Nutzer$/) do 
  @user = User.create(username: "Banane", password: "123456", email: "foo@bar.de")
end

Wenn(/^ich dann auf Anmelden klicke$/) do
  click_link "Anmelden"
end

Wenn(/^das Anmeldeformular ausfülle und es Abschicke$/) do
  fill_in 'password', with: '123456'
  fill_in 'username', with: @user.username
  click_button "Anmelden"
end

Dann(/^bin ich angemeldet$/) do
  page.should have_content(@user.username)
  page.should have_content("Abmelden")
end
