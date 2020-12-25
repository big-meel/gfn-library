class Game < ApplicationRecord

  # has_one_attached :cover
  serialize :genres

  scope :filter_by_title, -> (title) { where(title: title.parameterize.underscore) unless title.nil? || title.blank? }
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

