class HomeController < ApplicationController
  def index
    Game.connection
    @games = Game.all
  end
end
