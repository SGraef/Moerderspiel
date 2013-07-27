class UserMailer < ActionMailer::Base
  default from: "stuga@informatik.uni-bremen.de"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject =>  "Mörderspiel Passwort zurücksetzen")
  end
  
  def send_jobs(player)
    @player = player
    mail(to: player.get_email,
         subject: "Aufträge für #{player.game.name}")
  end
  
end
