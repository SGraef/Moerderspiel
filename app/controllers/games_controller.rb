class GamesController < ApplicationController
  def index
    @opengames = []
    @closedgames = []
    current_user.player.each do |player|
      if player.game.status == "finished"
        @closedgames << player.game
      elsif player.game.status == "open"
        @opengames << player.game
      end
    end
    
  end

  def show
    @game = Game.find(params[:id])
    if current_user
      @player = Player.where(user_id: current_user.id, game: @game).first
    else
      @player = Player.new
    end
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
    @closedgames = Game.where(gamemaster: current_user, status: "finished")
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
     if game.participate(nil, params[:name], params[:email])
       redirect_to game, notice: "Erfolgreich für das Spiel #{game.name} angemeldet"
     else
       redirect_to game, :flash => {error: "Anmeldung nicht möglich! 
       Es wurde die E-Mail-Adresse oder der Name schonmal für dieses Spiel verwendet"}
     end
    end
  end
  
  def kill
    game = Game.find(params[:id])
    if current_user
      job = Job.where(killer_id: params[:killer], victim_id: params[:victim],status: "unfinished").first
      if job
        job.kill(params[:plot], params[:date])
      else
        redirect_to game, :flash =>{error: "kein Passernder Auftrag gefunden"}
      end
    else
      job = Job.where(key: params[:key], victim: params[:victim],status: "unfinished").first
      if job
        job.kill(params[:plot])
      else
        redirect_to game, :flash =>{error: "kein Passernder Auftrag gefunden"}
      end
    end
    if game.jobs.where(status: "unfinished").empty?
      game.end
      redirect_to game, notice: "Dies war der letzte Auftrag das Spiel ist beendet"
    else
      redirect_to game, notice: "Mord Erfolgreich gemeldet"
    end
  end
  
  def start
    game = Game.find(params[:id])
    if game.start
      redirect_to game, notice: "Spiel Erfolgreich gestartet! Möge das Morden Beginnen"
    else
      redirect_to game, :flash =>{error: "konnte das Spiel nicht starten"}
    end
  end
  
  def end_game
    game = Game.find(params[:id])
    if game.end_game
      redirect_to game, notice: "Spiel Erfolgreich gestartet! Möge das Morden Beginnen"
    else
      redirect_to game, :flash =>{error: "konnte das Spiel nicht starten"}
    end
  end
  
  private
  def game_params
    params[:game].permit(:name, :circle_count, :tweet, :starttime, :endtime)
  end
end
