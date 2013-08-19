class RankingsController < ApplicationController
  before_action :set_ranking, only: [:show, :edit, :update, :destroy]
  def index
    @rankings = Ranking.all
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking
      @ranking = Ranking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ranking_params
      params.require(:ranking).permit(:user_id, :points, :sos)
    end
end
