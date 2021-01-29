class GamesController < ApplicationController
  include GamesHelper

  require 'set'

  def index
    # @games = Game.all
    # byebug
    # @page = params[:page] || 1
    @games = Game.search(params[:search]).page(1).per(100)

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
    params.permit(:search, :genre, :online_store, :page)
  end

end
