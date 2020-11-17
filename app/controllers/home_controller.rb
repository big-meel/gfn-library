class HomeController < ApplicationController
  def index
    @games = Game.load_all_games
  end
end
