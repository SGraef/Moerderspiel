class SessionsController < ApplicationController
  def new
    end
  
    def create
      user = login(params[:username], params[:password], params[:remember_me])
      if user
        redirect_back_or_to root_url, :notice => "Erfolgreich Angemeldet"
      else
        flash.now.alert = "Benutzername oder Passwort Falsch"
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to root_url, :notice => "Erfolgreich Abgemeldet"
    end
end
