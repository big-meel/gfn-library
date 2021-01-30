class GamesController < ApplicationController
  include GamesHelper

  require 'set'

  def index
    @page = params[:page] || 1
    @games = Game.search(params[:search]).page(@page).per(100)

    # @games = filter_by_genre(@games, params[:genre])
  end

  private

  def filter_by_genre(records, genre)
    if genre
        return records.select { |game| Set(genre).subset?(Set(game.genres)) }
      else
        return records.all
      end
    end

  def search_params
    params.permit(:search, :genre, :online_store)
  end

end
