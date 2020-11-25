class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  private

  def search_params
    params.permit!
  end

end
