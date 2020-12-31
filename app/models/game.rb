class Game < ApplicationRecord

  # has_one_attached :cover
  serialize :genres

  # scope :filter_by_genre, -> (genre) { where("? IN genre", genre) }
  scope :filter_by_store, -> (online_store) { where(store: online_store.parameterize.underscore ) unless online_store.nil? || online_store.blank? }

  def self.search(keyword)
    if keyword
      keyword = keyword.downcase
      return distinct.where("LOWER(games.title) LIKE LOWER(?)", "%#{keyword}%")
    else
      return all
    end
  end

end

