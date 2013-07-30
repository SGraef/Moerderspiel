class GamesController < ApplicationController
  def index
    @opengames = []
    @closedgames = []
    current_user.player.each do |player|
      if player.game.status == "closed"
        @closedgames << player.game
      else
        @opengames << player.game
      end
    end
    
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
    @game = Game.new(game_params)
    @game.gamemaster = current_user
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @game = Game.new
  end
  
  def gamemaster
    @opengames = Game.where(gamemaster: current_user, status: "open") + Game.where(gamemaster: current_user, status: "running")
    @closedgames = Game.where(gamemaster: current_user, status: "closed")
  end
  
  def participate
    game = Game.find(params[:id])
    if current_user
     if game.participate(current_user)
       redirect_to game, notice: "Erfolgreich für das Spiel #{game.name} angemeldet"
     else
       redirect_to game, :flash => {error: "Anmeldung nicht möglich! 
       Es wurde die E-Mail-Adresse oder der Name schonmal für dieses Spiel verwendet"}
     end
    else
     if game.participate(nil, params[:player][:name], params[:player][:email])
       redirect_to game, notice: "Erfolgreich für das Spiel #{game.name} angemeldet"
     else
       redirect_to game, :flash => {error: "Anmeldung nicht möglich! 
       Es wurde die E-Mail-Adresse oder der Name schonmal für dieses Spiel verwendet"}
     end
    end
  end
  
  def kill
    game = Game.find(params[:id])
    
    redirect_to game, notice: "Mord Erfolgreich gemeldet"
  end
  private
  def game_params
    params[:game].permit(:name, :circle_count, :tweet, :starttime, :endtime)
  end
end
