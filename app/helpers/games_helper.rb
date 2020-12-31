module GamesHelper
  require 'set'


  def filter_by_genre(records, genre)
    if genre
      return records.select { |game| Set(genre).subset?(Set(game.genres)) }
    else
      return records.all
    end
  end

end
