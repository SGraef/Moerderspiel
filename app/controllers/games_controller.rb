class GamesController < ApplicationController
  def index
    @opengames = Game.where(gamemaster: current_user)
    @closedgames = []
    current_user.player.each do |player|
      @opengames << player.game.where{status != "closed"}
      @closedgames << player.game.where(status: "closed")
    end
    
  end

  def show
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
    @games = Game.where(gamemaster: current_user)
  end
  
  private
  def game_params
    params[:game].permit(:name, :circle_count, :tweet, :starttime, :endtime)
  end
end
