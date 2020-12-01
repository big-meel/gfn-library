class GamesController < ApplicationController
  def index
    # @games = Game.all
    @games = Game.search(params[:search])
  end

  private

  def search_params
    params.permit(:search)
  end

end
