class HomeController < ApplicationController
  def index
    Game.connection

    @page = params[:page] || 1

    @games = Game.page(@page).per(25)
  end
end
