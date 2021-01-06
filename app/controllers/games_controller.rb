class GamesController < ApplicationController
  include GamesHelper

  require 'set'

  def index
    # @games = Game.all
    @games = Game.search(params[:search])

    # @games = filter_by_genre(@games, params[:genre])
    # byebug
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
