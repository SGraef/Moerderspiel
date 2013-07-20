class WelcomeController < ApplicationController
  def index
    if current_user
     @user_games = Game.where(gamemaster: current_user).last(5)
    end
  end
  
  def show_game_by_name
    name = params[:name]
    game = Game.where(name: name).first
    if game
      redirect_to game
    else
      redirect_to root_path, :flash => { :error => "Das Spiel \"#{name}\" wurde nicht gefunden" }
    end
  end
end
