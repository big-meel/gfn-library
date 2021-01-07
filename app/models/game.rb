class Game < ApplicationRecord

  require 'set'
  
  # has_one_attached :cover
  serialize :genres
  
  # scope :filter_by_genre, -> (genre) { where("? IN genre", genre) }
  scope :filter_by_store, -> (online_store) { where(store: online_store ) unless online_store.nil? || online_store.blank? }
  
  def self.search(keyword)
    if keyword
      keyword = keyword.downcase
      return distinct.where("LOWER(games.title) LIKE LOWER(?)", "%#{keyword}%")
    else
      return all
    end
  end


  def self.scrape_images(title)
    url = "https://api.igdb.com/v4/games"
    headers = { "Client-ID" => ENV["ClientID"], Authorization: ENV["Authorization"] }
    query = { fields: 'cover.*', search: title }

    response = HTTParty.post(
      url,
      headers: headers,
      query: query
    ).to_s


    JSON.parse(response)[0]["cover"] rescue nil

  end

  # def self.filter_by_genre(records, genre)
  #   if genre
  #       return records.select { |game| Set(genre).subset?(Set(game.genres)) }
  #     else
  #       return records.all
  #     end
  #   end

  def self.all_genres
    ["Action","Adventure", "Casual", "Free To Play", "Indie", "Massively Multiplayer Online", "Role Playing", "Simulation", "Sports", "Racing",
    "Strategy"]
  end
end

